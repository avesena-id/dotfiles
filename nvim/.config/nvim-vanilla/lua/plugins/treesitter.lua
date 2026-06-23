return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      ensure_installed = {
        "lua", "bash", "yaml", "toml", "json", "markdown", "markdown_inline",
        "dockerfile", "cpp", "c", "go", "astro", "svelte", "vue",
        "typescript", "javascript", "html", "css", "python"
      },
      highlight = { enabled = true },
      indent = { enabled = true },
    },
  },
}
