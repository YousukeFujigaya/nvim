-- [[ Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
-- local term_opts = { silent = true }
-- local _opts = { noremap = true, silent = true, expr = true }

-- [[ Basic Keymaps ]]
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>me', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

---------------------------------------------------------------------------------------------------------
-- split view
-- vim.keymap.set('n', 'ss', ':split<Return><C-w>w', opts)
-- vim.keymap.set('n', 'sv', ':vsplit<Return><C-w>w', opts)
vim.keymap.set('n', '<leader>ss', ':split<Return><C-w>w', opts)
vim.keymap.set('n', '<leader>sv', ':vsplit<Return><C-w>w', opts)

-- move to active buffer window
vim.keymap.set('n', '<M-h>', '<C-w>h', opts)
vim.keymap.set('n', '<M-k>', '<C-w>k', opts)
vim.keymap.set('n', '<M-j>', '<C-w>j', opts)
vim.keymap.set('n', '<M-l>', '<C-w>l', opts)
-- vim.keymap.set('n', 'sh', '<C-w>h', opts)
-- vim.keymap.set('n', 'sk', '<C-w>k', opts)
-- vim.keymap.set('n', 'sj', '<C-w>j', opts)
-- vim.keymap.set('n', 'sl', '<C-w>l', opts)
--------------------------------------------------------------------------------------------------------
-- Normal --
-- Better window navigation
keymap('n', '<c-h>', '<C-w>h', opts)
-- keymap('n', '<C-j>', '<C-w>j', opts) -- TODO: conflict
-- keymap('n', '<C-k>', '<C-w>k', opts) -- TODO: conflict
keymap('n', '<c-l>', '<C-w>l', opts)

-- Resize with arrows
keymap('n', '<C-Up>', ':resize -2<CR>', opts)
keymap('n', '<C-Down>', ':resize +2<CR>', opts)
keymap('n', '<C-Left>', ':vertical resize -2<CR>', opts)
keymap('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- Navigate buffers
keymap('n', '<S-l>', ':bnext<CR>', opts)
keymap('n', '<S-h>', ':bprevious<CR>', opts)

-- Move text up and down
-- keymap('n', '<A-j>', '<Esc>:m .+1<CR>==gi', opts)
-- keymap('n', '<A-k>', '<Esc>:m .-2<CR>==gi', opts)

-- Insert --
-- Press jk fast to exit insert mode
keymap('i', 'jj', '<ESC>', opts)
keymap('i', 'jk', '<ESC>', opts)
keymap('i', 'kk', '<ESC>', opts)
keymap('i', 'kj', '<ESC>', opts)

-- Visual --
-- Stay in indent mode
-- keymap('v', '<', '<gv', opts)
-- keymap('v', '>', '>gv', opts)

-- Move text up and down
-- keymap('v', '<A-j>', ':m .+1<CR>==', opts)
-- keymap('v', '<A-k>', ':m .-2<CR>==', opts)
-- keymap('v', 'p', '"_dP', opts)

-- Visual Block --
-- Move text up and down
-- keymap('x', 'J', ":move '>+1<CR>gv-gv", opts)
-- keymap('x', 'K', ":move '<-2<CR>gv-gv", opts)
-- keymap('x', '<A-j>', ":move '>+1<CR>gv-gv", opts)
-- keymap('x', '<A-k>', ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap('t', '<C-h>', '<C-\\><C-N><C-w>h', term_opts)
-- keymap('t', '<C-j>', '<C-\\><C-N><C-w>j', term_opts)
-- keymap('t', '<C-k>', '<C-\\><C-N><C-w>k', term_opts)
-- keymap('t', '<C-l>', '<C-\\><C-N><C-w>l', term_opts)
