return {
  {
    "dlyongemallo/diffview-plus.nvim",
    opts = {
      enhanced_diff_hl = true,
      diffopt = { algorithm = "histogram" },
      hooks = {
        diff_buf_read = function()
          vim.opt_local.wrap = false
        end,
      },
    },
    keys = {
      { "<leader>gb", "<cmd>.DiffviewFileHistory --follow<cr>", desc = "Line History" },
      { "<leader>gf", "<cmd>DiffviewFileHistory %<cr>", desc = "File History" },
      { "<leader>gc", "<cmd>DiffviewClose<cr>", desc = "Close Git" },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 200,
      },
    },
  },
}
