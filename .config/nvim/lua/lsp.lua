require'nvim-treesitter.configs'.setup {
    ensure_installed = { "lua", "vim", "vimdoc", "markdown", "go" },
    highlight = { enable = true },
    indent = { enable = true },
}

local capabilities = vim.lsp.protocol.make_client_capabilities()

local on_attach = function(client, bufnr)
    local opts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set("n","gd",vim.lsp.buf.definition,opts)
    vim.keymap.set("n","K",vim.lsp.buf.hover,opts)
    vim.keymap.set("n","<leader>rn",vim.lsp.buf.rename,opts)
    vim.keymap.set("n","<leader>ca",vim.lsp.buf.code_action,opts)
end

vim.lsp.config.gopls = {
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_markers = { "go.work", "go.mod", ".git" },
    capabilities = capabilities,
    on_attach = on_attach,
}

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})

vim.lsp.enable("gopls")

