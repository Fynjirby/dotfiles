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

    require("telescope").load_extension("fzf")

    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>tf", builtin.find_files, { desc = "Telescope find files" })
    vim.keymap.set("n", "<leader>tg", builtin.live_grep, { desc = "Telescope live grep" })

    vim.keymap.set("n", "<leader>t", function()
        vim.cmd.tabnew()
        vim.cmd.terminal()
        vim.cmd.startinsert()
    end, { desc = "Open a builtin terminal in a new tabpage" })

    vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })
end

return M
