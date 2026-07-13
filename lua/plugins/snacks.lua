return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = { enabled = false },
      explorer = { enabled = false },
      scroll = { enabled = false },
      picker = {
        sources = {
          explorer = {
            layout = {
              layout = {
                width = 60,
              },
            },
            win = {
              list = {
                keys = {
                  ["A"] = "explorer_add_dotnet",
                },
              },
            },
            actions = {
              explorer_add_dotnet = function(picker)
                local dir = picker:dir()
                local easydotnet = require("easy-dotnet")

                easydotnet.create_new_item(dir, function(item_path)
                  local tree = require("snacks.explorer.tree")
                  local actions = require("snacks.explorer.actions")
                  tree:open(dir)
                  tree:refresh(dir)
                  actions.update(picker, { target = item_path })
                  picker:focus()
                end)
              end,
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
          Snacks.picker.files({ cwd = vim.fs.root(vim.fn.getcwd(), ".git") })
        end,
        desc = "Find Files",
      },
      { "<leader>fb", false },
      { "<leader>fB", false },
      { "<leader>ff", false },
      { "<leader>fF", false },
      { "<leader>fg", false },

      { "<leader>/", false },
      {
        "<leader>sg",
        function()
          Snacks.picker.grep({ cwd = vim.fs.root(vim.fn.getcwd(), ".git") })
        end,
        desc = "Grep",
      },
      { "<leader>sG", false },
      { "<leader>sa", false },
      { "<leader>sl", false },
      { "<leader>sH", false },
      { "<leader>sp", false },
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
