local lsp = require("lsp-zero")
local nnoremap = require("keller00.keymap").nnoremap

lsp.preset("recommended")
local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    nnoremap('gd', function() vim.lsp.buf.definition() end, opts)
    nnoremap('K', function() vim.lsp.buf.hover() end, opts)
    nnoremap('<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
    nnoremap('<leader>vd', function() vim.diagnostic.open_float() end, opts)
    nnoremap('[d', function() vim.diagnostic.goto_next() end, opts)
    nnoremap(']d', function() vim.lsp.buf.code_action() end, opts)
    nnoremap('<leader>vca', function() vim.lsp.buf.references() end, opts)
    nnoremap('<leader>vrn', function() vim.lsp.buf.rename() end, opts)
    nnoremap('<C-h>', function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
