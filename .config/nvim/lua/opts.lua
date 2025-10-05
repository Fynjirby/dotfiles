vim.cmd('syntax on')
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
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("config") .. "/undo"
vim.opt.undolevels = 1000
vim.opt.clipboard = "unnamedplus" -- or "unnamedplus" for Linux

vim.api.nvim_set_hl(0, "TabLine",      { fg = "#8F908A", bg = "#2B2B2B" })  -- unactive
vim.api.nvim_set_hl(0, "TabLineSel",   { fg = "#DCDCCC", bg = "#4e8a4e" })  -- active 
vim.api.nvim_set_hl(0, "TabLineFill",  { bg = "#1C1C1C" })                  -- bg
vim.api.nvim_set_hl(0, "TabLineSep",   { fg = "#3C3C3C", bg = "#1C1C1C" })  -- sepparators

vim.api.nvim_set_hl(0, "VertSplit", { fg = "#767676", bg = "#767676" })

require('lualine').setup{
    options = {
        theme = {
            normal = {
                a = { fg = '#FFFFFF', bg = '#333333' },
                b = { fg = '#FFFFFF', bg = '#2e2e2e' },
                c = { fg = '#AAAAAA', bg = '#2e2e2e' },
            },
            insert = { a = { fg = '#FFFFFF', bg = '#444444' } },
            visual = { a = { fg = '#FFFFFF', bg = '#555555' } },
            replace = { a = { fg = '#FFFFFF', bg = '#660000' } },
            inactive = {
                a = { fg = '#AAAAAA', bg = '#222222' },
                b = { fg = '#AAAAAA', bg = '#222222' },
                c = { fg = '#AAAAAA', bg = '#222222' },
            },
        },
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
    },
    sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {
            {
                function()
                    local devicons = require('nvim-web-devicons')
                    local filename = vim.fn.expand('%:t')
                    local icon, icon_color = devicons.get_icon_color(filename, vim.fn.expand('%:e'), {default = true})
                    return icon .. ' ' .. filename
                end,
                color = { gui = 'bold' },
                cond = function() return vim.fn.empty(vim.fn.expand('%:t')) ~= 1 end,
            },
            {
                'diagnostics',
                sources = { 'nvim_diagnostic' },
                symbols = { error = ' ', warn = ' ', info = ' ' },
                diagnostics_color = {
                    error = { fg = '#ec5f67' },
                    warn = { fg = '#ECBE7B' },
                    info = { fg = '#008080' },
                },
            },
            { function() return '%=' end },
            {
                function()
                    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
                    local clients = vim.lsp.get_clients({ bufnr = 0 }) 
                    if next(clients) == nil then
                        return "No LSP"
                    end
                    for _, client in ipairs(clients) do
                        local filetypes = client.config.filetypes
                        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                            return client.name
                        end
                    end
                    return "No LSP"
                end,
                icon = '',
                color = { fg = '#DCDCCC', gui = 'bold' },
            },
        },
        lualine_x = {
            { 'progress', color = { fg = '#DCDCCC', gui = 'bold' } }, 
            { 'location', color = { fg = '#DCDCCC' } },              
        },
    },
}

require('nvim-autopairs').setup({
    check_ts = true,
    disable_filetype = { "TelescopePrompt", "vim" },
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

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

