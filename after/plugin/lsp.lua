local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("i", "<C-d>", function() vim.lsp.buf.type_definition() end, opts)
    vim.keymap.set({"n", "i"}, "<F3>", function() vim.lsp.buf.format() end, opts)
    vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>nr", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "<leader>pr", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>od", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>af", function() vim.lsp.buf.code_action() end, opts)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 'clangd', 'lua_ls', 'asm_lsp'},
    handlers = {
        lsp_zero.default_setup,
    },
})
