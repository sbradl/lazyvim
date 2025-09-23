return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "csharp-language-server",
        "netcoredbg",
      },
    },
  },
  {
    "nicholasmata/nvim-dap-cs",
    dependencies = { "mfussenegger/nvim-dap" },
  },
}
