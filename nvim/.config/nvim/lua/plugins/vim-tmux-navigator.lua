return {
  "christoomey/vim-tmux-navigator",
  event = "VeryLazy",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
  },
  keys = {
    { "<c-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Window/Pane Left" },
    { "<c-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Window/Pane Down" },
    { "<c-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Window/Pane Up" },
    { "<c-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Window/Pane Right" },
  },
}
