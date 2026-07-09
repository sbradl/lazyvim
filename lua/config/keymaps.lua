-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.api.nvim_set_keymap("n", "<S-Tab>", "<cmd>e #<cr>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-l>", "<C-w>h", { desc = "Go to Left window", remap = true })
vim.keymap.set("n", "<C-d>", "<C-w>j", { desc = "Go to Lower window", remap = true })
vim.keymap.set("n", "<C-u>", "<C-w>k", { desc = "Go to Upper window", remap = true })
vim.keymap.set("n", "<C-r>", "<C-w>l", { desc = "Go to Right window", remap = true })

vim.keymap.set("n", "<leader>e", "<leader>fm", { desc = "File explorer", remap = true })

vim.keymap.set("n", "<leader>z", "<leader>uZ", { desc = "Toggle Zoom Mode", remap = true })

vim.keymap.del("n", "<leader>`")
vim.keymap.del("n", "<leader>L")
vim.keymap.del("n", "<leader>fn")
vim.keymap.del("n", "<leader>ft")
vim.keymap.del("n", "<leader>fT")
vim.keymap.del("n", "<leader>gG")
vim.keymap.del("n", "<leader>dpp")
vim.keymap.del("n", "<leader>dph")
vim.keymap.del("n", "<leader>dps")
vim.keymap.del("n", "<leader>wm")
vim.keymap.del("n", "<leader>wd")
vim.keymap.del("n", "<leader>|")
vim.keymap.del("n", "<leader>-")
vim.keymap.del("n", "<leader><tab><tab>")
vim.keymap.del("n", "<leader><tab>d")
vim.keymap.del("n", "<leader><tab>f")
vim.keymap.del("n", "<leader><tab>l")
vim.keymap.del("n", "<leader><tab>o")
vim.keymap.del("n", "<leader><tab>[")
vim.keymap.del("n", "<leader><tab>]")

vim.keymap.set("n", "<leader>cb", "<cmd>Dotnet build solution<cr>", { desc = "Build" })
vim.keymap.set("n", "<leader>cB", "<cmd>Dotnet build solution quickfix<cr>", { desc = "Build with diagnostics" })
vim.keymap.set("n", "<leader>ce", "<cmd>Dotnet run profile default<cr>", { desc = "Execute" })
