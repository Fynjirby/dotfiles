vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.wrap = true
vim.opt.swapfile = false
vim.opt.hlsearch = true
vim.opt.ruler = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.visualbell = true
vim.opt.showmode = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("config") .. "/undo"
vim.opt.undolevels = 1000
vim.opt.clipboard = "unnamedplus" -- or "unnamedplus" for Linux

vim.api.nvim_set_hl(0, "Normal", { bg = "#0C0C0C" })
vim.api.nvim_set_hl(0, "NonText", { bg = "#0C0C0C" })
vim.api.nvim_set_hl(0, "LineNr", { bg = "#0C0C0C" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "#0C0C0C" })
vim.api.nvim_set_hl(0, "VertSplit", { fg = "#2A2A2A", bg = "#0C0C0C" })
vim.api.nvim_set_hl(0, "StatusLine", { fg = "#2A2A2A", bg = "#0C0C0C" })
vim.api.nvim_set_hl(0, "TabLine", { fg = "#8F908A", bg = "#2B2B2B" })
vim.api.nvim_set_hl(0, "TabLineSel", { fg = "#DCDCCC", bg = "#4E8A4E" })
vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#181818" })
vim.api.nvim_set_hl(0, "Visual", { bg = "#252525" })

require("lualine").setup({
    options = {
        component_separators = "",
        section_separators = "",
        theme = {
            normal = {
                a = { fg = "#E0E0E0", bg = "#202020" },
                b = { fg = "#CCCCCC", bg = "#1A1A1A" },
                c = { fg = "#AAAAAA", bg = "#101010" },
            },
        },
        globalstatus = true,
    },
    sections = {
        lualine_a = {
            {
                function()
                    return ""
                end,
                color = { fg = "#0C0C0C", bg = "#0C0C0C" },
            },
            {
                "mode",
                fmt = function(mode)
                    return " " .. mode
                end,
                separator = { left = "", right = "" },
                padding = 0,
                color = function()
                    local m = vim.fn.mode()
                    if m == "n" then
                        return { fg = "#1E222A", bg = "#7AA2F7", gui = "bold" }
                    elseif m == "i" then
                        return { fg = "#202020", bg = "#98C379", gui = "bold" }
                    elseif m == "v" or m == "V" or m == "" then
                        return { fg = "#202020", bg = "#C678DD", gui = "bold" }
                    elseif m == "c" then
                        return { fg = "#202020", bg = "#E5C07B", gui = "bold" }
                    end
                    return { fg = "#E0E0E0", bg = "#202020", gui = "bold" }
                end,
            },
            {
                "branch",
                icon = "",
                separator = { left = "", right = "" },
                padding = 1,
                color = { fg = "#E0E0E0", bg = "#202020", gui = "bold" },
            },
            {
                "diff",
                symbols = { added = "+", modified = "~", removed = "-" },
                separator = { right = "" },
                padding = 0,
                diff_color = {
                    added = { fg = "#98C379" },
                    modified = { fg = "#E5C07B" },
                    removed = { fg = "#E06C75" },
                },
            },
        },
        lualine_b = {},
        lualine_c = {
            {
                function()
                    local devicons = require("nvim-web-devicons")
                    local name = vim.fn.expand("%:t")
                    local icon = devicons.get_icon(name, vim.fn.expand("%:e"), { default = true })
                    return icon .. " " .. name
                end,
                cond = function()
                    return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
                end,
                color = { gui = "bold" },
            },
            {
                "diagnostics",
                sources = { "nvim_diagnostic" },
                symbols = { error = " ", warn = " ", info = " " },
                diagnostics_color = {
                    error = { fg = "#ec5f67" },
                    warn = { fg = "#ECBE7B" },
                    info = { fg = "#008080" },
                },
            },
            {
                function()
                    return "%="
                end,
            },
        },
        lualine_x = {},
        lualine_y = {
            {
                function()
                    local ft = vim.bo.filetype
                    for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
                        if client.config.filetypes and vim.tbl_contains(client.config.filetypes, ft) then
                            return client.name
                        end
                    end
                    return "No LSP"
                end,
                icon = "",
                color = { fg = "#DCDCCC", bg = "#101010", gui = "bold" },
            },
            {
                "progress",
                separator = { left = "" },
                color = { fg = "#DCDCCC", gui = "bold" },
            },
            {
                "location",
                color = { fg = "#DCDCCC" },
            },
            {
                function()
                    return "󰈚 " .. vim.fn.line("$")
                end,
            },
            {
                function()
                    return ""
                end,
                color = { fg = "#1A1A1A", bg = "#0C0C0C" },
                padding = 0,
            },
        },
        lualine_z = {},
    },
})

require("nvim-autopairs").setup({
    check_ts = true,
    fast_wrap = {
        map = "<M-e>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = "[%)%>%]%)%}%,]",
        offset = 0,
        end_key = "$",
        keys = "qwertyuiop",
        check_comma = true,
        highlight = "Search",
        highlight_grey = "Comment",
    },
})
