-- lsp.lua (new API)

require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "ts_ls",
        "pyright",
        "html",
        "cssls",
        "jsonls",
    },
})

-- keymaps khi attach
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local opts = { buffer = args.buf }

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    end,
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- config từng server
vim.lsp.config("lua_ls", {
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
        },
    },
})

vim.lsp.config("ts_ls", {
    capabilities = capabilities,
})

vim.lsp.config("pyright", {
    capabilities = capabilities,
})

vim.lsp.config("html", {
    capabilities = capabilities,
})

vim.lsp.config("cssls", {
    capabilities = capabilities,
})

vim.lsp.config("jsonls", {
    capabilities = capabilities,
})

-- enable tất cả
vim.lsp.enable({
    "lua_ls",
    "ts_ls",
    "pyright",
    "html",
    "cssls",
    "jsonls",
})

-- diagnostics UI
vim.diagnostic.config({
    virtual_text = true,
    underline = true,
})
