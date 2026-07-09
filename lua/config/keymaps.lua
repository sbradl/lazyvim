-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.api.nvim_set_keymap("n", "<S-Tab>", "<cmd>e #<cr>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-l>", "<C-w>h", { desc = "Go to Left window", remap = true })
vim.keymap.set("n", "<C-d>", "<C-w>j", { desc = "Go to Lower window", remap = true })
vim.keymap.set("n", "<C-u>", "<C-w>k", { desc = "Go to Upper window", remap = true })
vim.keymap.set("n", "<C-r>", "<C-w>l", { desc = "Go to Right window", remap = true })

vim.keymap.set("n", "<leader>e", "<leader>fm", { desc = "Open Directory of current file", remap = true })

vim.keymap.set("n", "<leader>z", "<leader>uZ", { desc = "Toggle Zoom Mode", remap = true })

vim.keymap.del("n", "<leader>`")
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

local function focus_first_terminal()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local buftype = vim.bo[buf].buftype

    if buftype == "terminal" then
      vim.api.nvim_set_current_win(win)
      return
    end
  end

  vim.cmd("Dotnet terminal show")
  vim.cmd("startinsert")
end
vim.keymap.set("n", "gt", focus_first_terminal, { desc = "Go to Terminal" })
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

vim.keymap.set("n", "<leader>cb", "<cmd>Dotnet build solution<cr>", { desc = "Build" })
vim.keymap.set("n", "<leader>cB", "<cmd>Dotnet build solution quickfix<cr>", { desc = "Build with diagnostics" })
vim.keymap.set("n", "<leader>ce", "<cmd>Dotnet run profile default<cr>", { desc = "Execute" })
