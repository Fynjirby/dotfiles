local plugins = {
    { "nvim-treesitter/nvim-treesitter", branch = "master", lazy = false, build = ":TSUpdate" },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = { "gopls", "clangd", "lua-language-server" },
        },
    },
    { "neovim/nvim-lspconfig" },
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
                pattern = { "*.c", "*.h", "Makefile", "*.sh", "*.lua" },
                command = "FormatWrite",
            })
        end,
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
        "ray-x/go.nvim",
        dependencies = {
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function(lp, opts)
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
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },
    {
        "hrsh7th/nvim-compe",
        config = function()
            require("compe").setup({
                enabled = true,
                autocomplete = true,
                source = {
                    buffer = true,
                    path = true,
                },
            })
        end,
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
    { "windwp/nvim-autopairs", dependencies = { "nvim-cmp" } },
    -- add more plugins here
}
return plugins
