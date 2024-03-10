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

-- Telescope file browser
require('telescope').load_extension 'file_browser'

local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>l', builtin.live_grep, { desc = '[l]ive Grep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader>o', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[f]ind files' })
-- LSP mappings
vim.keymap.set('n', '<leader>ls', builtin.lsp_document_symbols, { desc = '[l]sp symbols in current buffer' })
vim.keymap.set('n', '<leader>lr', builtin.lsp_references, { desc = '[l]sp [r]efrences' })
vim.keymap.set('n', '<leader>lw', builtin.lsp_dynamic_workspace_symbols, { desc = '[l]sp [W]orkspace Symbols' })
vim.keymap.set('n', '<leader>li', builtin.lsp_implementations, { desc = '[l]sp fint [i]mplimentations' })
vim.keymap.set('n', '<leader>ld', builtin.lsp_definitions, { desc = '[l]sp [D]efinitions' })

-- Telescope file browser
vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', { desc = '[F]ile [B]rowser', noremap = true })