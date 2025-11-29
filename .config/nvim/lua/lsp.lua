require("nvim-treesitter.configs").setup({
    ensure_installed = { "lua", "vim", "vimdoc", "markdown", "go" },
    highlight = { enable = true },
    indent = { enable = true },
})

local capabilities = vim.lsp.protocol.make_client_capabilities()

local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
end

vim.lsp.config.gopls = {
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_markers = { "go.work", "go.mod", ".git" },
    capabilities = capabilities,
    on_attach = on_attach,
}

vim.lsp.config.clangd = {
    cmd = { "clangd" },
    filetypes = { "c", "cpp", "objc", "objcpp", "h", "hpp" },
    root_markers = { ".clangd", ".clang-tidy", "compile_commands.json", "compile_flags.txt", ".git" },
    capabilities = capabilities,
    on_attach = on_attach,
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
    on_attach = on_attach,
}

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.c", "*.h", "*.cpp", "*.hpp", ".go", ".lua" },
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})

vim.lsp.enable("gopls")
vim.lsp.enable("clangd")
vim.lsp.enable("lua_ls")
