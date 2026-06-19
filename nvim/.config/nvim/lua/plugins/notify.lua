return {
  -- Mengubah konfigurasi nvim-notify bawaan AstroNvim
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 5000,
      stages = "slide",
      render = "wrapped-compact",
    },
    config = function(_, opts)
      local notify = require "notify"
      notify.setup(opts)
      vim.api.nvim_set_hl(0, "NotifyBackground", { bg = "NONE" })
      vim.notify = notify
    end,
  },
}
