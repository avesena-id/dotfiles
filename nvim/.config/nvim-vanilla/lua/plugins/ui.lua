return {
    {
        'sainnhe/gruvbox-material',
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.gruvbox_material_enable_italic = true
            vim.cmd.colorscheme('gruvbox-material')
        end
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        event = "VimEnter",
        keys = {
            { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Neo-tree" },
        },
        opts = {
            window = {
                position = "float",
                popup = {
                    size = { height = "80%", width = "50%" },
                    position = "50%",
                },
            },
            filesystem = {
                hijack_netrw_behavior = "open_default",
                use_libuv_file_watcher = true,
                window = {
                    mappings = {},
                },
            },
            popup_border_style = "rounded",
        },
        config = function(_, opts)
            require("neo-tree").setup(opts)

            vim.api.nvim_create_autocmd("VimEnter", {
                callback = function()
                    local arg = vim.fn.argv(0) or ""
                    if vim.fn.isdirectory(arg) == 1 then
                        require("neo-tree.command").execute({ action = "show", dir = arg })
                    end
                end,
            })
        end,
    },
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            bigfile = { enabled = true },
            notifier = { enabled = true },
            picker = { enabled = true },
            input = { enabled = true },
            scope = { enabled = true },
            dashboard = {
                enabled = true,
                sections = {
                    { section = "header" },
                    { section = "keys",   gap = 1, padding = 1 },
                    { section = "startup" },
                },
                preset = {
                    keys = {
                        { icon = " ", key = "n", desc = "Create New File", action = ":ene | startinsert" },
                        { icon = "󰈞 ", key = "f", desc = "Find File", action = function() Snacks.picker.files() end },
                        { icon = " ", key = "g", desc = "Grep Text", action = function() Snacks.picker.grep() end },
                        { icon = " ", key = "c", desc = "Config Neovim", action = function() Snacks.picker.files({ cwd =
                            vim.fn.stdpath("config") }) end },
                        { icon = " ", key = "q", desc = "Quit Neovim", action = ":qa" },
                    },
                },
            },
        },
        keys = {
            { "<leader>ff", function() Snacks.picker.files() end,   desc = "Find Files" },
            { "<leader>fw", function() Snacks.picker.grep() end,    desc = "Find Words (Grep)" },
            { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
            -- Shortcut tambahan untuk membuka kembali dashboard saat sedang coding
            { "<leader>fh", function() Snacks.dashboard.open() end, desc = "Home / Dashboard" },
        },
    },
}
