---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.typescript", ft = { "javascript", "typescript", "typescriptreact" } },
  { import = "astrocommunity.pack.astro", ft = "astro" },
  { import = "astrocommunity.pack.vue", ft = "vue" },
  { import = "astrocommunity.pack.svelte", ft = "svelte" },
  {
    import = "astrocommunity.pack.tailwindcss",
    ft = { "html", "css", "javascript", "typescript", "vue", "astro", "svelte" },
  },
  { import = "astrocommunity.pack.python", ft = "python" },
  { import = "astrocommunity.pack.go", ft = { "go", "gomod", "gowork", "gotmpl" } },
  { import = "astrocommunity.pack.rust", ft = { "rust", "toml" } },
  { import = "astrocommunity.pack.markdown", ft = "markdown" },
  { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim", ft = "markdown" },
  { import = "astrocommunity.pack.lua", ft = "lua" },
  { import = "astrocommunity.pack.bash", ft = "sh" },
  { import = "astrocommunity.pack.mdx", ft = "mdx" },
}
