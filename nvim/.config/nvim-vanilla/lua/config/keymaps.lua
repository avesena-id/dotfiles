local keymap = vim.keymap.set

keymap({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

keymap({"v", "i"}, "jk", "<esc>")
keymap("n", "<leader>w", "<cmd>w<cr>")
keymap("n", "<leader>W", "<cmd>wa!<cr>")
keymap("n", "<leader>q", "<cmd>q<cr>")
keymap("n", "<leader>Q", "<cmd>qa!<cr>")

keymap("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window" })

keymap("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
keymap("n", "]d", function() 
  vim.diagnostic.jump({ count = 1, float = true }) 
end, { desc = "Next Diagnostic" })
keymap("n", "[d", function() 
  vim.diagnostic.jump({ count = -1, float = true }) 
end, { desc = "Prev Diagnostic" })
keymap("n", "<leader>cx", function() 
  Snacks.picker.diagnostics() 
end, { desc = "Project Diagnostics" })

local keymap = vim.keymap.set

keymap("n", "<leader>tn", "<cmd>tabnew<cr>", { desc = "New Tab Page" })
keymap("n", "<leader>tc", "<cmd>tabclose<cr>", { desc = "Close Current Tab" })
keymap("n", "<leader>to", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
keymap("n", "<leader>tl", "<cmd>tabnext<cr>", { desc = "Next Tab Page" })
keymap("n", "<leader>th", "<cmd>tabprevious<cr>", { desc = "Prev Tab Page" })

keymap("n", "<Tab>", function()
  if vim.fn.pumvisible() == 1 then
    return "<Tab>"
  else
    vim.cmd("bnext")
  end
end, { expr = false, silent = true, desc = "Next Buffer / File" })

keymap("n", "<S-Tab>", function()
  if vim.fn.pumvisible() == 1 then
    return "<S-Tab>"
  else
    vim.cmd("bprev")
  end
end, { expr = false, silent = true, desc = "Prev Buffer / File" })
keymap("n", "<leader>x", "<cmd>bdelete<cr>", { silent = true, desc = "Close Current Buffer/File" })
