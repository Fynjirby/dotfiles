local M = {}

function M.setup()
    vim.g.mapleader = ","

    vim.keymap.set("n", "<leader>n", ":tabnew<CR>")
    vim.keymap.set("n", "<leader>c", ":tabclose<CR>")
    vim.keymap.set("n", "<leader>q", ":bd<CR>")
    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
    vim.keymap.set("n", "<leader>f", ":NvimTreeFocus<CR>", { desc = "Focus file explorer" })

    for i = 1, 8 do
        vim.keymap.set("n", "<leader>" .. i, i .. "gt")
    end

    vim.keymap.set("n", "<Esc>", ":noh<CR>")

    vim.keymap.set("n", "H", "^")
    vim.keymap.set("n", "L", "$")
    vim.keymap.set("v", "H", "^")
    vim.keymap.set("v", "L", "$")

    vim.keymap.set("n", "<leader>a", function()
        vim.lsp.buf.code_action()
    end, { noremap = true, silent = true })

    vim.api.nvim_set_keymap(
        "i",
        "<Tab>",
        'pumvisible() ? "<C-n>" : "<Tab>"',
        { expr = true, noremap = true, silent = true }
    )
end

return M
