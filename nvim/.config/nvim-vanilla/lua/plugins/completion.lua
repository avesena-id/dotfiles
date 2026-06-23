return {
  {
    "saghen/blink.cmp",
    version = "*",
    event = "InsertEnter",
    dependencies = "rafamadriz/friendly-snippets",
    opts = {
      keymap = {
        preset = "none", 

        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },

        ["<CR>"] = { "accept", "fallback" },

        ["<C-space>"] = { "show", "show_documentation", "hide" },
        ["<C-e>"] = { "hide", "fallback" },
      },

      completion = {
        list = {
          selection = {
            preselect = true,
            auto_insert = false,
          },
        },
        menu = { border = "rounded" },
        documentation = { window = { border = "rounded" } },
      },

      appearance = { use_nvim_cmp_as_default = true, nerd_font_variant = "mono" },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
    },
  }
}
