return {
  {
    "nvim-neotest/neotest",
    dependencies = {
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
