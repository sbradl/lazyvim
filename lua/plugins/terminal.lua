return {
  {
    "sbradl/terminal.nvim",
    config = function()
      local t = require("terminal")
      t.setup()

      vim.keymap.set("n", "gt", t.focus_last_terminal, { desc = "Go to Terminal" })
      vim.keymap.set("n", "<C-t>", t.open_new_terminal, { desc = "Open New Terminal", remap = true })
      vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
    end,
  },
  {
    "sbradl/command_runner.nvim",
    dependencies = { "sbradl/terminal.nvim" },
    config = function()
      local r = require("command_runner")
      r.setup()

      vim.keymap.set("n", "<leader>rc", r.run_command, { desc = "Run command for current file", remap = true })
      vim.keymap.set("n", "<leader>rh", r.show_history, { desc = "Show command history", remap = true })
      -- vim.keymap.set("n", "<leader>rr", r.rerun_command, { desc = "Rerun previous command", remap = true })
      require("which-key").add({
        {
          "<leader>rr",
          r.rerun_command,
          desc = function()
            return r.rerun_command_description() or "Rerun last command"
          end,
        },
      })
    end,
  },
}
