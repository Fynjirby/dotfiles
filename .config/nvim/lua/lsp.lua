require("nvim-treesitter.configs").setup({
    ensure_installed = { "lua", "vim", "vimdoc", "markdown", "go", "bash" },
    highlight = { enable = true },
    indent = { enable = true },
})

local capabilities = vim.lsp.protocol.make_client_capabilities()

vim.lsp.config.gopls = {
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_markers = { "go.work", "go.mod", ".git" },
    capabilities = capabilities,
}

vim.lsp.config.clangd = {
    cmd = { "clangd" },
    filetypes = { "c", "cpp", "objc", "objcpp", "h", "hpp" },
    root_markers = { ".clangd", ".clang-tidy", "compile_commands.json", "compile_flags.txt", ".git" },
    capabilities = capabilities,
}

vim.lsp.config.lua_ls = {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { ".luarc.json", ".luacheckrc", ".git" },
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry = { enable = false },
        },
    },
    capabilities = capabilities,
}

vim.lsp.enable("gopls")
vim.lsp.enable("clangd")
vim.lsp.enable("lua_ls")

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})
