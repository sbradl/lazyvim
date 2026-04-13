-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.api.nvim_set_keymap("n", "<S-Tab>", "<cmd>e #<cr>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-Left>", "<C-w>h", { desc = "Go to Left window", remap = true })
vim.keymap.set("n", "<C-Down>", "<C-w>j", { desc = "Go to Lower window", remap = true })
vim.keymap.set("n", "<C-Up>", "<C-w>k", { desc = "Go to Upper window", remap = true })
vim.keymap.set("n", "<C-Right>", "<C-w>l", { desc = "Go to Right window", remap = true })

vim.keymap.set("n", "<S-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<S-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<S-Left>", "<cmd>vertical resize -2<cr>", { desc = "Increase Window Width" })
vim.keymap.set("n", "<S-Right>", "<cmd>vertical resize +2<cr>", { desc = "Decrease Window Width" })

local function focus_first_terminal()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local buftype = vim.bo[buf].buftype

    if buftype == "terminal" then
      vim.api.nvim_set_current_win(win)
      return
    end
  end

  print("No terminal window found")
end
vim.keymap.set("n", "gt", focus_first_terminal, { desc = "Go to Terminal" })
