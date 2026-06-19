return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      position = "float",
      -- Konfigurasi khusus untuk layout floating agar center
      popup_size = {
        width = "50%",
        height = "75%",
      },
    },
    -- Atur spesifik perilaku float agar presisi di tengah layar
    filesystem = {
      window = {
        mappings = {
          ["<space>"] = "none",
        },
      },
    },
    -- Memaksa posisi jendela pop-up berada di tengah editor (center)
    popup_border_style = "rounded", -- Opsi: "none", "single", "double", "rounded", "shadow"
  },
  config = function(_, opts)
    -- Memastikan opsi bawaan AstroNvim tidak menimpa posisi float center
    require("neo-tree").setup(opts)
  end,
}
