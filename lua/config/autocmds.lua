-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- Enable Snacks.dim automatically at startup

-- Dim inactive windows (whole window, not just text) so the focused split is obvious
local DIM = "Normal:NormalNC,SignColumn:NormalNC,LineNr:NormalNC,LineNrAbove:NormalNC,"
  .. "LineNrBelow:NormalNC,CursorLineNr:NormalNC,EndOfBuffer:NormalNC,FoldColumn:NormalNC,WinBar:NormalNC"

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "onedark",
  callback = function()
    local ok, colors = pcall(require, "onedark.colors")
    if ok then
      vim.api.nvim_set_hl(0, "NormalNC", { bg = colors.bg_d })
    end
  end,
})
if vim.g.colors_name == "onedark" then
  vim.api.nvim_exec_autocmds("ColorScheme", { pattern = "onedark" })
end

vim.api.nvim_create_autocmd({ "WinEnter", "WinLeave" }, {
  callback = function(args)
    local win = vim.api.nvim_get_current_win()
    if vim.api.nvim_win_get_config(win).relative == "" then
      vim.wo[win].winhighlight = (args.event == "WinLeave") and DIM or ""
    end
  end,
})
