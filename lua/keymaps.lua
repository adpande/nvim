local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

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

-- Trouble mappings
vim.keymap.set('n', '<leader>xx', function()
  require('trouble').toggle()
end)
vim.keymap.set('n', '<leader>xo', function()
  require('trouble').open { mode = 'split' }
end)
vim.keymap.set('n', '<leader>xw', function()
  require('trouble').toggle 'workspace_diagnostics'
end)
vim.keymap.set('n', '<leader>xd', function()
  require('trouble').toggle 'document_diagnostics'
end)
vim.keymap.set('n', '<leader>xq', function()
  require('trouble').toggle 'quickfix'
end)
vim.keymap.set('n', '<leader>xl', function()
  require('trouble').toggle 'loclist'
end)
vim.keymap.set('n', 'gR', function()
  require('trouble').toggle 'lsp_references'
end)

vim.keymap.set('t', '<M-h>', '<C-\\><C-n><C-w>h', { desc = 'Terminal [H]orizontal' })
vim.keymap.set('t', '<M-j>', '<C-\\><C-n><C-w>j', { desc = 'Terminal [J]ump' })
vim.keymap.set('t', '<M-k>', '<C-\\><C-n><C-w>k', { desc = 'Terminal [K]ill' })
vim.keymap.set('t', '<M-l>', '<C-\\><C-n><C-w>l', { desc = 'Terminal [L]ateral' })

-- Oil plugin keymaps
vim.keymap.set('n', '<leader>O', function()
  local cwd = vim.fn.getcwd()
  require('oil').toggle_float(cwd)
end, { desc = 'Open [O]il' })

-- Nvim Spectre mappings (search and replace)
vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
  desc = 'Toggle Spectre',
})
-- vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
--     desc = "Search current word"
-- })
-- vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
--     desc = "Search current word"
-- })
vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
  desc = 'Search on current file',
})

-- Telescope file browser
vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', { desc = '[F]ile [B]rowser', noremap = true })

-- Telescope file browser
require('telescope').load_extension 'file_browser'
-- Terminal mode mappings
-- tnoremap ([[<M-h>]], [[<C-\><C-n><C-w>h]])
-- tnoremap ([[<M-j>]], [[<C-\><C-n><C-w>j]])
-- tnoremap ([[<M-k>]], [[<C-\><C-n><C-w>k]])
-- tnoremap ([[<M-l>]], [[<C-\><C-n><C-w>l]])
-- Harpoon setup
local harpoon = require 'harpoon'

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set('n', '<leader>a', function()
  harpoon:list():append()
end)
vim.keymap.set('n', '<C-e>', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set('n', '1', function()
  harpoon:list():select(1)
end)
vim.keymap.set('n', '2', function()
  harpoon:list():select(2)
end)
vim.keymap.set('n', '3', function()
  harpoon:list():select(3)
end)
vim.keymap.set('n', '4', function()
  harpoon:list():select(4)
end)
vim.keymap.set('n', '5', function()
  harpoon:list():select(4)
end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set('n', '<C-S-P>', function()
  harpoon:list():prev()
end)
vim.keymap.set('n', '<C-S-N>', function()
  harpoon:list():next()
end)

vim.keymap.set({ 'i' }, '<C-s>', '<C-o>:w<ENTER>')
vim.keymap.set({ 'n' }, '<C-s>', ':w<ENTER>')
-- Move text up and down
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', opts)
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', opts)

-- Press jk fast to exit insert mode
vim.keymap.set('i', 'jk', '<ESC>', opts)
vim.keymap.set('i', 'kj', '<ESC>', opts)

-- Move text up and down
vim.keymap.set('x', 'J', ":m '>+1<CR>gv=gv", opts)
vim.keymap.set('x', 'K', ":m '<-2<CR>gv=gv", opts)
vim.keymap.set('x', '<A-j>', ":m '>+1<CR>gv=gv", opts)
vim.keymap.set('x', '<A-k>', ":m '<-2<CR>gv=gv", opts)

vim.keymap.set('n', '<Backspace>', '<C-w>h', opts)
vim.keymap.set('n', '<TAB>', '<C-w>l', opts)
