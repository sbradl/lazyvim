return {
  {
    "ThePrimeagen/refactoring.nvim",
    keys = {
      { "<leader>cp", "", desc = "+print", mode = { "n", "x" } },
      {
        "<leader>cpl",
        function()
          return require("refactoring.debug").print_loc({ output_location = "below" })
        end,
        desc = "Debug Print Location",
        expr = true,
      },
      {
        "<leader>cpv",
        function()
          return require("refactoring.debug").print_var({ output_location = "below" }) .. "iw"
        end,
        mode = { "n", "x" },
        desc = "Debug Print Variable",
        expr = true,
      },
      {
        "<leader>cpc",
        function()
          return require("refactoring.debug").cleanup({ restore_view = true }) .. "ag"
        end,
        desc = "Debug Cleanup",
        expr = true,
      },
      { "<leader>ci", "", desc = "+inline", mode = { "n", "x" } },
      {
        "<leader>civ",
        function()
          return require("refactoring").inline_var()
        end,
        mode = { "n", "x" },
        desc = "Inline Variable",
        expr = true,
      },
      {
        "<leader>cif",
        function()
          return require("refactoring").inline_func()
        end,
        mode = { "n", "x" },
        desc = "Inline Function",
        expr = true,
      },
      { "<leader>cx", "", desc = "+extract", mode = { "n", "x" } },
      {
        "<leader>cxf",
        function()
          return require("refactoring").extract_func()
        end,
        mode = { "n", "x" },
        desc = "Extract Function",
        expr = true,
      },
      {
        "<leader>cxF",
        function()
          return require("refactoring").extract_func_to_file()
        end,
        mode = { "n", "x" },
        desc = "Extract Function To File",
        expr = true,
      },
      {
        "<leader>cxv",
        function()
          return require("refactoring").extract_var()
        end,
        mode = { "n", "x" },
        desc = "Extract Variable",
        expr = true,
      },
    },
  },
}
