return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        --     "csharp-language-server",
        "netcoredbg",
        "roslyn",
      })

      opts.registries = opts.registries or {}

      vim.list_extend(opts.registries, {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      })
    end,
  },
  {
    "nicholasmata/nvim-dap-cs",
    dependencies = { "mfussenegger/nvim-dap" },
  },
  {
    "seblyng/roslyn.nvim",
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig,
    opts = {},
    ft = "cs",
    config = function()
      require("roslyn").setup({
        on_attach = function(client, bufnr) end,
        capabilities = vim.lsp.protocol.make_client_capabilities(),
      })
    end,
  },
}
