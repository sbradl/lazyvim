return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nsidorenco/neotest-vstest",
      -- "marilari88/neotest-vitest",
      "nvim-neotest/neotest-jest",
    },
    opts = {
      adapters = {
        ["neotest-vstest"] = {
          dap_settings = {
            type = "coreclr",
          },
        },
        -- "neotest-vitest",
        "neotest-jest",
      },
    },
  },
}
