local lsp = require("lsp-zero")
local nmap = require("keller00.keymap").nmap

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

    nremap('gd', function() vim.lsp.buf.definition() end, opts)
    nremap('K', function() vim.lsp.buf.hover() end, opts)
    nremap('<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
    nremap('<leader>vd', function() vim.diagnostic.open_float() end, opts)
    nremap('[d', function() vim.diagnostic.goto_next() end, opts)
    nremap(']d', function() vim.lsp.buf.code_action() end, opts)
    nremap('<leader>vca', function() vim.lsp.buf.references() end, opts)
    nremap('<leader>vrn', function() vim.lsp.buf.rename() end, opts)
    nremap('<C-h>', function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()
