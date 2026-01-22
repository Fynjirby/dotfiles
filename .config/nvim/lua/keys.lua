vim.g.mapleader = ","

vim.keymap.set("n", ",n", ":tabnew<CR>", { silent = true, desc = "New Tab" })
vim.keymap.set("n", ",c", ":tabclose<CR>", { silent = true, desc = "Close Tab" })
vim.keymap.set("n", ",q", ":bd<CR>", { silent = true, desc = "Close Buffer" })
vim.keymap.set("n", ",e", ":NvimTreeToggle<CR>", { silent = true, desc = "Toggle file explorer" })
vim.keymap.set("n", ",f", ":NvimTreeFocus<CR>", { silent = true, desc = "Focus file explorer" })

vim.keymap.set("n", "<leader>og", function()
    vim.g.compile_method = "gcc"
    print("Compile method set to GCC")
end, { noremap = true, silent = false, desc = "GCC" })

vim.keymap.set("n", "<leader>oc", function()
    vim.g.compile_method = "clang"
    print("Compile method set to Clang")
end, { noremap = true, silent = false, desc = "Clang" })

vim.keymap.set("n", "<leader>om", function()
    vim.g.compile_method = "make"
    print("Compile method set to Make")
end, { noremap = true, silent = false, desc = "Make" })

vim.keymap.set("n", "<leader>ob", function()
    vim.g.compile_method = "go"
    print("Compile method set to Go build")
end, { noremap = true, silent = false, desc = "Go build" })

local function compile()
    local method = vim.g.compile_method
    local fname = vim.fn.expand("%")
    local base = vim.fn.expand("%:r")
    if method == "gcc" then
        vim.cmd("!gcc " .. fname .. " -o " .. base)
    elseif method == "clang" then
        vim.cmd("!clang " .. fname .. " -o " .. base)
    elseif method == "make" then
        vim.cmd("!make")
    elseif method == "go" then
        vim.cmd("!go build -o " .. base .. " " .. fname)
    else
        print("No compile method selected. Use <leader>o to set.")
    end
end

local function run()
    if vim.g.compile_method == "gcc" or vim.g.compile_method == "clang" or vim.g.compile_method == "go" then
        vim.cmd(":!./%:r")
    elseif vim.g.compile_method == "make" then
        vim.cmd(":!make run")
    else
        print("No compile method selected. Use <leader>o to set.")
    end
end

vim.keymap.set("n", "<leader>d", compile, { noremap = true, silent = false, desc = "Compile" })
vim.keymap.set("n", "<leader>r", run, { noremap = true, silent = false, desc = "Run" })
vim.keymap.set("n", "<leader>b", function()
    compile()
    run()
end, { noremap = true, silent = false, desc = "Compile and run" })

for i = 1, 8 do
    vim.keymap.set("n", "<leader>" .. i, i .. "gt", { desc = "Go to N tab" })
end

vim.keymap.set("n", "<Esc>", ":noh<CR>", { silent = true, desc = "No highlight" })

vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")
vim.keymap.set("v", "H", "^")
vim.keymap.set("v", "L", "$")

vim.keymap.set("n", "<leader>a", function()
    vim.lsp.buf.code_action()
end, { noremap = true, silent = true, desc = "See code actions" })

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover quick info" })
vim.keymap.set("n", "<leader>td", function()
    local is_enabled = vim.diagnostic.is_enabled()
    if is_enabled then
        vim.diagnostic.enable(false)
        print("Diagnostics disabled")
    else
        vim.diagnostic.enable(true)
        print("Diagnostics enabled")
    end
end, { noremap = true, silent = true, desc = "Toggle Diagnostics" })

vim.keymap.set("n", "<leader>tr", function()
    local is_enabled = vim.wo.relativenumber

    if is_enabled then
        vim.wo.relativenumber = false
        print("Relative numbers disabled")
    else
        vim.wo.relativenumber = true
        print("Relative numbers enabled")
    end
end, { noremap = true, silent = true, desc = "Toggle Relative Numbers" })

vim.keymap.set(
    "i",
    "<Tab>",
    'pumvisible() ? "<C-n>" : "<Tab>"',
    { expr = true, noremap = true, silent = true, desc = "Autocomplete" }
)
