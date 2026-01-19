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
vim.api.nvim_set_hl(0, "StatusLine", { fg = "#2A2A2A", bg = "#141414" })
vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#2A2A2A", bg = "#141414" })
vim.api.nvim_set_hl(0, "TabLine", { fg = "#8F908A", bg = "#2B2B2B" })
vim.api.nvim_set_hl(0, "TabLineSel", { fg = "#DCDCCC", bg = "#4E8A4E" })
vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#181818" })
vim.api.nvim_set_hl(0, "Visual", { bg = "#252525" })

vim.api.nvim_set_hl(0, "LualineBranch", { fg = "#E0E0E0", bg = "#202020", bold = true })
vim.api.nvim_set_hl(0, "LualineGitAdd", { fg = "#98C379", bg = "#202020", bold = true })
vim.api.nvim_set_hl(0, "LualineGitChange", { fg = "#E5C07B", bg = "#202020", bold = true })
vim.api.nvim_set_hl(0, "LualineGitDelete", { fg = "#E06C75", bg = "#202020", bold = true })

require("lualine").setup({
    options = {
        theme = {
            normal = {
                a = { fg = "#E0E0E0", bg = "#202020" },
                b = { fg = "#CCCCCC", bg = "#1A1A1A" },
                c = { fg = "#AAAAAA", bg = "#101010" },
            },
        },
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
    },
    sections = {
        lualine_a = {
            {
                function()
                    local mode = vim.fn.mode()
                    local modes = {
                        n = "NORMAL",
                        i = "INSERT",
                        v = "VISUAL",
                        V = "V-LINE",
                        ["\22"] = "V-BLOCK",
                        c = "COMMAND",
                        r = "REPLACE",
                    }

                    local name = modes[mode] or mode:upper()
                    local icon = " " or ""

                    return icon .. name
                end,
                separator = { left = "", right = "" },
                padding = { left = 0, right = 0 },
                color = function()
                    local mode = vim.fn.mode()
                    if mode == "n" then
                        return { fg = "#1E222A", bg = "#7AA2F7", gui = "bold" }
                    elseif mode == "i" then
                        return { fg = "#202020", bg = "#98C379", gui = "bold" }
                    elseif mode == "v" or mode == "V" then
                        return { fg = "#202020", bg = "#C678DD", gui = "bold" }
                    elseif mode == "c" then
                        return { fg = "#202020", bg = "#E5C07B", gui = "bold" }
                    end
                    return { fg = "#E0E0E0", bg = "#202020", gui = "bold" }
                end,
            },
            {
                function()
                    local branch = vim.b.gitsigns_head
                    if not branch or branch == "" then
                        return ""
                    end

                    local gs = vim.b.gitsigns_status_dict or {}
                    local parts = {}

                    table.insert(parts, "%#LualineBranch# " .. branch .. " %*")

                    if gs.added and gs.added > 0 then
                        table.insert(parts, "%#LualineGitAdd#+" .. gs.added .. " %*")
                    end
                    if gs.changed and gs.changed > 0 then
                        table.insert(parts, "%#LualineGitChange#~" .. gs.changed .. " %*")
                    end
                    if gs.removed and gs.removed > 0 then
                        table.insert(parts, "%#LualineGitDelete#-" .. gs.removed .. " %*")
                    end

                    return table.concat(parts)
                end,
                separator = { left = "", right = "" },
                padding = 0,
                cond = function()
                    return vim.b.gitsigns_head ~= nil
                end,
            },
        },
        lualine_b = {},
        lualine_y = {
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
                icon = "",
                color = { fg = "#DCDCCC", bg = "#101010", gui = "bold" },
            },
            {
                "progress",
                color = { fg = "#DCDCCC", gui = "bold" },
                separator = { left = "" },
            },
            {
                "location",
                color = { fg = "#DCDCCC" },
            },
        },
        lualine_z = {},
        lualine_c = {
            {
                function()
                    local devicons = require("nvim-web-devicons")
                    local filename = vim.fn.expand("%:t")
                    local icon, icon_color = devicons.get_icon_color(filename, vim.fn.expand("%:e"), { default = true })
                    return icon .. " " .. filename
                end,
                color = { gui = "bold" },
                cond = function()
                    return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
                end,
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

require("compe").setup({
    enabled = true,
    autocomplete = true,
    source = {
        buffer = true,
        path = true,
    },
})
