return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto", 
          component_separators = { left = "❘", right = "❘" },
          section_separators = { left = "", right = "" },
          globalstatus = true,
        },
        sections = {
          lualine_a = { { "mode", separator = { left = "", right = "" }, right_padding = 2 } },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = {
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            { "filename", path = 1 },
          },
          lualine_x = {
            {
              function()
                local msg = "No Active LSP"
                local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
                local clients = vim.lsp.get_clients({ bufnr = 0 })
                if next(clients) == nil then return msg end
                local active_clients = {}
                for _, client in ipairs(clients) do
                  table.insert(active_clients, client.name)
                end
                return "LSP: " .. table.concat(active_clients, ", ")
              end,
              icon = " ",
              color = { fg = "#ffffff", gui = "bold" },
            },
          },
          lualine_y = { "progress" },
          lualine_z = { { "location", separator = { left = "", right = "" }, left_padding = 2 } },
        },
      })
    end,
  },
}
