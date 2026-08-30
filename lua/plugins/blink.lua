return {
  -- Drop friendly-snippets: use a curated set in ~/.config/nvim/snippets instead.
  { "rafamadriz/friendly-snippets", enabled = false },
  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        providers = {
          snippets = {
            opts = {
              friendly_snippets = false,
            },
          },
        },
      },
    },
  },
}
