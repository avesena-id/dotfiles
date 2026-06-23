local opt = vim.opt
local g = vim.g
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
g.python3_host_prog = vim.fn.trim(vim.fn.system("/home/dev/.config/nvim/.venv/bin/python"))

opt.fillchars:append({ eob = " " })
opt.number = true
opt.splitright = true
opt.splitbelow = true
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true
opt.termguicolors = true
opt.ignorecase = true
opt.smartcase = true
opt.cursorline = true
opt.updatetime = 250
opt.clipboard = "unnamedplus"
opt.laststatus = 3
opt.cmdheight = 0
opt.showmode = false
opt.showcmd = false
opt.showtabline = 2
function MyTabLine()
    local s = ""
    local buffers = vim.api.nvim_list_bufs()
    local current_buf = vim.api.nvim_get_current_buf()

    for _, bufnr in ipairs(buffers) do
        if vim.api.nvim_buf_is_valid(bufnr) and vim.bo[bufnr].buflisted then
            local name = vim.api.nvim_buf_get_name(bufnr)
            if name == "" then
                name = "[No Name]"
            else
                name = vim.fn.fnamemodify(name, ":t")
            end
            if vim.bo[bufnr].modified then
                name = name .. " ●"
            end
            if bufnr == current_buf then
                s = s .. "%#TabLineSel#  " .. name .. "  "
            else
                s = s .. "%#TabLine#  " .. name .. "  "
            end
        end
    end

    s = s .. "%#TabLineFill#%="
    return s
end

vim.o.tabline = "%!v:lua.MyTabLine()"

vim.api.nvim_create_autocmd({ "FocusLost", "InsertLeave" }, {
    callback = function(args)
        local buf = args.buf
        local ft = vim.bo[buf].filetype

        if ft == "neo-tree" or ft == "neo-tree-popup" then
            return
        end

        if vim.bo[buf].modified
            and vim.bo[buf].modifiable
            and not vim.bo[buf].readonly
            and vim.bo[buf].buftype == ""
            and vim.api.nvim_buf_get_name(buf) ~= ""
        then
            pcall(function()
                vim.cmd("silent! write")
            end)
        end
    end,
})
vim.api.nvim_create_autocmd("VimEnter", {
    group = vim.api.nvim_create_augroup("NeoTreeInit", { clear = true }),
    callback = function(data)
        local path = data.file

        if vim.fn.isdirectory(path) == 1 then
            vim.cmd.cd(path)

            require("neo-tree.command").execute({
                action = "show",
                dir = path,
            })
        end
    end,
})
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight text when yanked",
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 150,
        })
    end,
})
