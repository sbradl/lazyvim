return {
  {
    "sindrets/diffview.nvim",
    opts = {
      hooks = {
        diff_buf_read = function()
          vim.opt_local.wrap = false
        end,
      },
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
