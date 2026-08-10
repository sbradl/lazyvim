local picker_util = require("util.picker")

return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = { enabled = false },
      explorer = { enabled = false },
      scroll = { enabled = false },
      git = { enabled = false },
      lazygit = {
        win = {
          width = 0.98,
          height = 0.92,
        },
      },
      picker = {
        layout = {
          layout = {
            width = 0.98,
            height = 0.92,
          },
        },
        sources = {
          explorer = {
            layout = {
              layout = {
                width = 60,
              },
            },
          },
        },
      },
    },
    keys = {
      { "<leader>e", false },
      { "<leader>fe", false },
      { "<leader>E", false },
      { "<leader>fE", false },

      { "<leader>gi", false },
      { "<leader>gI", false },
      { "<leader>gp", false },
      { "<leader>gP", false },
      { "<leader>gD", false },
      { "<leader>gS", false },

      { "<leader>S", false },
      { "<leader>.", false },

      {
        "<leader><space>",
        function()
          local root = assert(Snacks.git.get_root())
          Snacks.picker.files({
            cwd = root,
            live = true,
            on_show = picker_util.prefill_files_glob,
            filter = { transform = picker_util.restore_glob_prefix },
            title = "Files (" .. vim.fn.fnamemodify(root, ":~") .. ")",
          })
        end,
        desc = "Find Files (git)",
      },
      {
        "<leader>ff",
        function()
          local cwd = vim.fn.getcwd()
          Snacks.picker.files({
            cwd = cwd,
            live = true,
            on_show = picker_util.prefill_files_glob,
            filter = { transform = picker_util.restore_glob_prefix },
            title = "Files (" .. vim.fn.fnamemodify(cwd, ":~") .. ")",
          })
        end,
        desc = "Find Files (cwd)",
      },
      {
        "<leader>fp",
        function()
          local root = LazyVim.root()
          Snacks.picker.files({
            cwd = root,
            live = true,
            on_show = picker_util.prefill_files_glob,
            filter = { transform = picker_util.restore_glob_prefix },
            title = "Files (" .. vim.fn.fnamemodify(root, ":~") .. ")",
          })
        end,
        desc = "Find Files (project)",
      },
      { "<leader>fb", false },
      { "<leader>fB", false },
      { "<leader>fF", false },
      { "<leader>fg", false },

      { "<leader>/", false },
      {
        "<leader>sg",
        function()
          local root = assert(Snacks.git.get_root())
          Snacks.picker.grep({
            cwd = Snacks.git.get_root(),
            on_show = picker_util.prefill_grep_glob,
            filter = { transform = picker_util.restore_glob_prefix },
            title = "Grep (" .. vim.fn.fnamemodify(root, ":~") .. ")",
          })
        end,
        desc = "Grep (git)",
      },
      {
        "<leader>sf",
        function()
          local cwd = vim.fn.getcwd()
          Snacks.picker.grep({
            cwd = cwd,
            on_show = picker_util.prefill_grep_glob,
            filter = { transform = picker_util.restore_glob_prefix },
            title = "Grep (" .. vim.fn.fnamemodify(cwd, ":~") .. ")",
          })
        end,
        desc = "Grep (cwd)",
      },
      {
        "<leader>sp",
        function()
          local root = LazyVim.root()
          Snacks.picker.grep({
            cwd = root,
            on_show = picker_util.prefill_grep_glob,
            filter = { transform = picker_util.restore_glob_prefix },
            title = "Grep (" .. vim.fn.fnamemodify(root, ":~") .. ")",
          })
        end,
        desc = "Grep (project)",
      },
      { "<leader>sG", false },
      { "<leader>sa", false },
      { "<leader>sl", false },
      { "<leader>sH", false },
      { "<leader>:", false },
    },
  },
  {
    "folke/todo-comments.nvim",
    keys = {
      { "<leader>st", false },
      { "<leader>sT", false },
    },
  },
}
