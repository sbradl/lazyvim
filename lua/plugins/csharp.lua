return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ["*"] = {
          keys = {
            { "<leader>cc", false },
          },
        },
      },
    },
  },
  {
    "GustavEikaas/easy-dotnet.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("easy-dotnet").setup({
        debugger = { engine = "sharpdbg" },
        lsp = { auto_refresh_codelens = false },
      })
    end,
  },
}
