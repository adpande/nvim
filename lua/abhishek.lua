vim.filetype.add { extension = { templ = 'templ' } }

local lspconfig = require 'lspconfig'

lspconfig.html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'html', 'templ' },
}

lspconfig.htmx.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'html', 'templ' },
}

vim.api.nvim_create_autocmd({ 'BufWritePre' }, { pattern = { '*.templ' }, callback = vim.lsp.buf.format })

--require('ibl').setup()

-- Go Lang plugin setup
local format_sync_grp = vim.api.nvim_create_augroup('GoImport', {})
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.go',
  callback = function()
    require('go.format').goimport()
  end,
  group = format_sync_grp,
})
