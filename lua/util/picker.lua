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

-- Builds the " -- -g *.{ext1,ext2}" extension filter (ripgrep glob syntax)
-- for the extensions of all active LSPs.
function M.lsp_glob_search()
  local exts = M.lsp_extensions()
  if #exts == 0 then
    return nil
  end
  return (" -- -g *.{%s}"):format(table.concat(exts, ","))
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

-- Prepopulates the picker input with the LSP extension filter and puts the
-- cursor at the start of the line so the user can type a filter before it.
function M.prefill_lsp_glob(picker)
  local search = M.lsp_glob_search()
  if not search then
    return
  end
  picker.input:set(nil, search)
  vim.api.nvim_win_set_cursor(picker.input.win.win, { 1, 0 })
  -- Setting the input text programmatically doesn't reliably trigger the
  -- input's TextChanged-based auto re-search, so re-run the finder
  -- ourselves to make sure the glob is actually applied.
  picker:find({ refresh = false })
end

return M
