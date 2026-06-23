return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      signs = {
        add          = { text = "┃" },
        change       = { text = "┃" },
        delete       = { text = "_" },
        topdelete    = { text = "‾" },
        changedelete = { text = "~" },
        untracked    = { text = "┆" },
      },
      on_attach = function(bufnr)
        local gitsigns = require("gitsigns")

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        map("n", "]c", function()
          if vim.wo.diff then vim.cmd.feedkeys({"]c"}, "n", false) else gitsigns.nav_hunk("next") end
        end, { desc = "Next Git Hunk" })

        map("n", "[c", function()
          if vim.wo.diff then vim.cmd.feedkeys({"[c"}, "n", false) else gitsigns.nav_hunk("prev") end
        end, { desc = "Prev Git Hunk" })

        map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Stage Hunk" })
        map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Reset Hunk" })
        map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Preview Hunk" })
        map("n", "<leader>hb", function() gitsigns.blame_line({ full = true }) end, { desc = "Blame Line" })
      end,
    },
  },
}
