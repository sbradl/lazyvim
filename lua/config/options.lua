-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.relativenumber = false
vim.o.diffopt = "internal,filler,closeoff,linematch:40,iwhiteall"
vim.opt.foldenable = false

vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

if vim.fn.has("win32") == 1 and vim.fn.executable("pwsh.exe") == 1 then
  vim.o.shell = "pwsh.exe"
end
