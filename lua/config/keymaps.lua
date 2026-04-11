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

local matching_file_pairs = {
  { from = "%.spec%.ts$", to = ".ts" },
  { from = "%.ts$", to = ".spec.ts" },
}

local function open_in_split(target)
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local name = vim.api.nvim_buf_get_name(buf)
    if name == target then
      vim.api.nvim_set_current_win(win)
      return
    end
  end

  vim.cmd("vsplit " .. target)
  vim.cmd("write")
end

local function goto_matching_file()
  local file = vim.api.nvim_buf_get_name(0)
  local target

  for _, pair in ipairs(matching_file_pairs) do
    if file:match(pair.from) then
      target = file:gsub(pair.from, pair.to)
      break
    end
  end

  if not target then
    print("No matching file pair rule")
    return
  end

  if vim.fn.filereadable(target) == 1 then
    open_in_split(target)
  else
    local choice = vim.fn.confirm("Create corresponding file?\n" .. target, "&Yes\nNo", 2)

    if choice == 1 then
      open_in_split(target)
    else
      print("Aborted")
    end
  end
end

vim.keymap.set("n", "gm", goto_matching_file, { desc = "Go to matching file" })
