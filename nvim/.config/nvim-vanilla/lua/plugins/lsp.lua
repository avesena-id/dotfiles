return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "saghen/blink.cmp",
        },
        config = function()
            require("mason").setup()
            local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
            end

            vim.diagnostic.config({
                signs = true,
                underline = true,
                virtual_text = false,
            })
            local servers = {
                lua_ls = {},
                bashls = {},
                yamlls = {},
                taplo = {},
                jsonls = {},
                dockerls = {},
                clangd = {},
                gopls = {},
                astro = {},
                svelte = {},
                vue_ls = {},
                ts_ls = {},
                html = {},
                tailwindcss = {},
                basedpyright = {},
                ruff = {
                    init_options = { settings = { args = {} } },
                },
                biome = {},
            }

            -- Ambil kemampuan autocomplete dari blink.cmp
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            require("mason-lspconfig").setup({
                ensure_installed = vim.tbl_keys(servers),
                handlers = {
                    function(server_name)
                        local opts = servers[server_name] or {}
                        opts.capabilities = capabilities
                        require("lspconfig")[server_name].setup(opts)
                    end,
                },
            })

            -- Shortcut tombol saat LSP aktif
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    local bufnr = args.buf
                    local map = function(m, lhs, rhs, desc)
                        vim.keymap.set(m, lhs, rhs, { buffer = bufnr, desc = desc })
                    end

                    map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
                    map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
                    map("n", "<leader>cr", vim.lsp.buf.rename, "Rename Symbol")
                    map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
                end,
            })
        end,
    },
}
