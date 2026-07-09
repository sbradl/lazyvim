return {
  {
    "sbradl/terminal.nvim",
    config = function()
      local t = require("terminal")
      t.setup()

      vim.keymap.set("n", "gt", t.focus_last_terminal, { desc = "Go to Terminal" })
      vim.keymap.set("n", "gT", t.open_new_terminal, { desc = "Open New Terminal", remap = true })
      vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

      vim.keymap.set("n", "<leader>rr", t.run_command, { desc = "Run command for current file", remap = true })
    end,
  },
}
