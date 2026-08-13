local M = {}

-- Extensions handled by every currently active LSP client (not just the
-- current buffer's), derived from Neovim's own filetype registry so nothing
-- is hardcoded here.
function M.lsp_extensions()
  local fts = {} ---@type table<string, true>
  for _, client in ipairs(vim.lsp.get_clients()) do
    for _, ft in ipairs(client.config.filetypes or {}) do
      fts[ft] = true
    end
  end
  -- Some extensions (eg. `ts`) resolve their filetype dynamically based on
  -- buffer content; probe them against an empty scratch buffer to get their
  -- fallback filetype instead of skipping them.
  local scratch = vim.api.nvim_create_buf(false, true)
  local exts = {} ---@type string[]
  for ext, entry in pairs(vim.filetype.inspect().extension) do
    local ft = entry
    if type(entry) == "function" then
      local ok, result = pcall(entry, "dummy." .. ext, scratch)
      ft = ok and result or nil
    end
    if type(ft) == "string" and fts[ft] then
      exts[#exts + 1] = ext
    end
  end
  vim.api.nvim_buf_delete(scratch, { force = true })

  table.sort(exts)
  return exts
end

-- `Snacks.picker.util.parse` splits "<query> -- <args>" but requires actual
-- whitespace before "--"; a string that is only "-- <args>" (no query typed)
-- has nothing there to match. Fake a leading space in that case so the args
-- half still parses even when the user hasn't typed a query in front of it.
local function parse_query_args(text)
  if text:match("^%-%-") then
    text = " " .. text
  end
  return Snacks.picker.util.parse(text)
end

-- Sets the picker input, puts the cursor at the start of the line so the
-- user can type a filter before it, and re-runs the finder since setting
-- the input text programmatically doesn't reliably trigger the input's
-- TextChanged-based auto re-search. Live pickers (eg. grep) display and
-- re-search on `filter.search`; non-live pickers (eg. files) use
-- `filter.pattern`, so which slot to fill depends on the picker's mode.
local function apply_prefill(picker, text)
  if picker.opts.live then
    picker.input:set(nil, text)
  else
    picker.input:set(text)
  end
  vim.api.nvim_win_set_cursor(picker.input.win.win, { 1, 0 })
  picker:find({ refresh = false })
end

-- `picker:find()` searches on a *trimmed* clone of the input, so a search
-- string that is only "-- <args>" loses its leading space and the "-- "
-- args-split (which requires whitespace before "--") never matches. Restore
-- a leading space whenever that happens so the trailing glob still applies
-- even when the user hasn't typed a query in front of it yet.
function M.restore_glob_prefix(_, filter)
  if filter.search:match("^%-%-") then
    filter.search = " " .. filter.search
  end
end

-- Prepopulates the grep picker input with a ripgrep brace-alternation glob
-- (`-g *.{ext1,ext2}`) for the extensions of all active LSPs.
function M.prefill_grep_glob(picker)
  local exts = M.lsp_extensions()
  if #exts == 0 then
    return
  end
  apply_prefill(picker, (" -- -g *.{%s}"):format(table.concat(exts, ",")))
end

-- Splits the files picker's combined "<query> -- <fd args>" input (bound to
-- `filter.pattern` since the picker is non-live) so the query half still
-- drives Snacks' fuzzy matcher while the args half is handed to `fd`/`rg` as
-- literal flags via `filter.search` — keeping both fuzzy search and editable
-- extension filtering instead of live mode's all-or-nothing literal match.
function M.split_ft_filter(_, filter)
  local query, args = parse_query_args(filter.pattern)
  filter.pattern = query
  filter.search = #args > 0 and (" -- " .. table.concat(args, " ")) or ""
end

-- Prepopulates the files picker input with an fd extension filter
-- (`-e ext`, repeated; fd has no brace-alternation shorthand) for the
-- extensions of all active LSPs.
function M.prefill_files_glob(picker)
  local exts = M.lsp_extensions()
  if #exts == 0 then
    return
  end
  local parts = { "--" }
  for _, ext in ipairs(exts) do
    parts[#parts + 1] = "-e"
    parts[#parts + 1] = ext
  end
  apply_prefill(picker, " " .. table.concat(parts, " "))
end

return M
