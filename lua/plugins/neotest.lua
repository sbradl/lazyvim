return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nsidorenco/neotest-vstest",
      "marilari88/neotest-vitest",
    },
    opts = {
      adapters = {
        ["neotest-vstest"] = {
          dap_settings = {
            type = "coreclr",
          },
        },
        "neotest-vitest",
      },
    },
  },
}
