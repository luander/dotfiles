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

lsp.setup_nvim_cmp({
    documentation = {
        max_height = 25,
        max_width = 60,
        border = 'rounded',
        col_offset = 0,
        side_padding = 1,
        winhighlight = 'Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None',
        zindex = 1001
    }
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
