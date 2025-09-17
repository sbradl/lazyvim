return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "csharp-language-server",
      },
    },
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nsidorenco/neotest-vstest",
    },
    opts = {
      adapters = {
        "neotest-vstest",
      },
    },
  },
}
