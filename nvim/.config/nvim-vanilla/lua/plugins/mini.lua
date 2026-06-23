return {
  {
    "echasnovski/mini.nvim",
    version = false, -- Menggunakan versi master untuk pembaruan fitur konstan
    event = "VeryLazy",
    config = function()
      require("mini.pairs").setup({})
      require("mini.comment").setup({})

      require("mini.surround").setup({
        mappings = {
          add = "sa",     -- Add surround (Mode visual atau normal)
          delete = "sd",  -- Delete surround
          find = "sf",    -- Find surround
          replace = "sr", -- Replace surround
        },
      })

      require("mini.ai").setup({})
    end,
  },
}
