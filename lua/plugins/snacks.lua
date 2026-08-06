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
          Snacks.picker.git_files()
        end,
        desc = "Find Files (git)",
      },
      {
        "<leader>ff",
        function()
          Snacks.picker.files()
        end,
        desc = "Find Files (cwd)",
      },
      {
        "<leader>fp",
        function()
          Snacks.picker.files({ cwd = LazyVim.root() })
        end,
        desc = "Find Files (project)",
      },
      { "<leader>fb", false },
      { "<leader>fB", false },
      { "<leader>fF", false },
      { "<leader>fg", false },

      { "<leader>/", false },
      {
        "<leader>ss",
        function()
          Snacks.picker.grep({ cwd = Snacks.git.get_root() })
        end,
        desc = "Grep (git)",
      },
      {
        "<leader>sf",
        function()
          Snacks.picker.grep()
        end,
        desc = "Grep (cwd)",
      },
      {
        "<leader>sp",
        function()
          Snacks.picker.grep({ cwd = LazyVim.root() })
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
