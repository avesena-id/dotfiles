return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      on_highlights = function(hl, c)
        hl.StatusLine = { bg = "NONE", fg = c.fg_sidebar }
        hl.StatusLineNC = { bg = "NONE", fg = c.fg_gutter }
      end,
    },
    config = function(_, opts) require("tokyonight").setup(opts) end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      terminal_colors = true,
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      inverse = true,
      contrast = "hard",
      palette_overrides = {},
      dim_inactive = false,
      transparent_mode = true, -- Mengaktifkan transparansi dasar (Normal, SignColumn, dll)

      -- Menambahkan overrides untuk memaksa bagian lain tetap transparan
      overrides = {
        WinBar = { bg = "NONE" },
        WinBarNC = { bg = "NONE" },
        NavicIconsFile = { bg = "NONE" },
        NavicIconsModule = { bg = "NONE" },
        NavicText = { bg = "NONE" },
        NavicSeparator = { bg = "NONE" },
        -- Floating Windows (Telescope, LSP Hover, dll)
        NormalFloat = { bg = "NONE" },
        FloatBorder = { bg = "NONE" },

        -- File Tree / Sidebar (Neo-tree / Nvim-tree)
        NvimTreeNormal = { bg = "NONE" },
        NvimTreeNormalNC = { bg = "NONE" },
        NeoTreeNormal = { bg = "NONE" },
        NeoTreeNormalNC = { bg = "NONE" },

        -- Statusline & Tabline
        StatusLine = { bg = "NONE" },
        StatusLineNC = { bg = "NONE" },
        TabLine = { bg = "NONE" },
        TabLineFill = { bg = "NONE" },
        TabLineSel = { bg = "NONE" },

        -- Gutter / Batas Kolom kiri (Angka baris & Git signs)
        SignColumn = { bg = "NONE" },
        FoldColumn = { bg = "NONE" },
        LineNr = { bg = "NONE" },
      },
    },
    config = function(_, opts) require("gruvbox").setup(opts) end,
  },
}
