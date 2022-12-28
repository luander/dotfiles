local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.ensure_installed({
    'rust_analyzer',
    'sumneko_lua',
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    configure_diagnostics = true,
})

lsp.nvim_workspace()
lsp.setup()

vim.diagnostic.config {
    virtual_text = true,
    signs = true,
    underline = true,
}

-- Apply formatting on every file save
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]
