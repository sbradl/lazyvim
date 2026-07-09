return {
  {
    "sbradl/matching-file.nvim",
    config = function()
      local m = require("matching-file")
      m.setup()

      vim.keymap.set("n", "gm", m.goto_matching_file, { desc = "Go to matching file" })
    end,
  },
}
