local plugins = {
    { "nvim-treesitter/nvim-treesitter", branch = "master", lazy = false, build = ":TSUpdate" },
    { "neovim/nvim-lspconfig" },
    {
        "mason-org/mason.nvim",
        opts = {
            ensure_installed = { "gopls", "clangd", "lua-language-server" },
        },
    },
    {
        "mhartington/formatter.nvim",
        ft = { "c", "h", "make", "lua" },
        config = function()
            local formatter = require("formatter")

            formatter.setup({
                filetype = {
                    c = {
                        function()
                            return {
                                exe = "clang-format",
                                args = { "--style=file", "--fallback-style=LLVM" },
                                stdin = true,
                            }
                        end,
                    },
                    h = {
                        function()
                            return {
                                exe = "clang-format",
                                args = { "--style=file", "--fallback-style=LLVM" },
                                stdin = true,
                            }
                        end,
                    },
                    make = {
                        function()
                            return {
                                exe = "mbake",
                                args = { "format", "--stdin" },
                                stdin = true,
                            }
                        end,
                    },
                    lua = {
                        function()
                            return {
                                exe = "stylua",
                                args = {
                                    "--indent-type",
                                    "Spaces",
                                    "--indent-width",
                                    4,
                                    "-",
                                },
                                stdin = true,
                            }
                        end,
                    },
                },
            })

            vim.api.nvim_create_autocmd("BufWritePost", {
                pattern = { "*.c", "*.h", "Makefile", "*.sh", "*.lua", "*.cpp", "*.hpp", "*.zc", "Makefile" },
                command = "FormatWrite",
            })
        end,
    },

    {
        "ray-x/go.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        config = function(opts)
            require("go").setup(opts)
            local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = "*.go",
                callback = function()
                    require("go.format").goimports()
                end,
                group = format_sync_grp,
            })
        end,
        event = { "CmdlineEnter" },
        ft = { "go", "gomod" },
        build = ':lua require("go.install").update_all_sync()',
    },
    {
        "nanozuki/tabby.nvim",
        opts = {
            line = function(line)
                return {
                    line.tabs().foreach(function(tab)
                        local hl = tab.is_current() and "TabLineSel" or "TabLine"
                        return {
                            line.sep("", hl, "TabLineFill"),
                            tab.is_current() and "" or "",
                            tab.name(),
                            tab.number(),
                            line.sep(" ", hl, "TabLineFill"),
                            hl = hl,
                            margin = " ",
                        }
                    end),
                    line.spacer(),
                }
            end,
        },
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            signs = {
                add = { hl = "GitGutterAdd", text = "+" },
                change = { hl = "GitGutterChange", text = "~" },
                delete = { hl = "GitGutterDelete", text = "_" },
                topdelete = { hl = "GitGutterDelete", text = "‾" },
                changedelete = { hl = "GitGutterChange", text = "~" },
            },
            signcolumn = true,
            numhl = false,
            linehl = false,
            word_diff = false,
            watch_gitdir = {
                interval = 1000,
                follow_files = true,
            },
        },
    },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup({
                disable_netrw = true,
                hijack_netrw = true,
                update_focused_file = {
                    enable = true,
                    update_cwd = true,
                },
                view = {
                    width = 25,
                    side = "left",
                },
                renderer = {
                    icons = {
                        show = {
                            file = true,
                            folder = true,
                            folder_arrow = true,
                            git = true,
                        },
                    },
                },
                git = {
                    enable = true,
                    ignore = false,
                },
            })
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        lazy = true,
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                window = {},
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm({ select = false }),
                    ["<Tab>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-e>"] = cmp.mapping.abort(),
                }),
                sources = {
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                    { name = "path" },
                },
            })
        end,
    },
    {
        "hrsh7th/cmp-nvim-lsp",
        event = "VeryLazy",
        dependencies = {
            "neovim/nvim-lspconfig",
            "hrsh7th/nvim-cmp",
        },
    },
    { "windwp/nvim-autopairs" },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
    },
}
return plugins
