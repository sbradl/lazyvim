return {
  {
    "sbradl/terminal.nvim",
    config = function()
      local t = require("terminal")
      t.setup()

      vim.keymap.set("n", "gt", t.focus_last_terminal, { desc = "Go to Terminal" })
      vim.keymap.set("n", "gT", t.open_new_terminal, { desc = "Open New Terminal", remap = true })
      vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
    end,
  },
  {
    "sbradl/command_runner.nvim",
    dependencies = { "sbradl/terminal.nvim" },
    config = function()
      local r = require("command_runner")

      vim.keymap.set("n", "<leader>rc", r.run_command, { desc = "Run command for current file", remap = true })
      -- vim.keymap.set("n", "<leader>rr", r.run_last_command, { desc = "Rerun previous command", remap = true })
    end,
  },
}
