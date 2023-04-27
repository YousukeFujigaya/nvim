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
local keymap = function(mode, keys, func, opts)
  local _opts = {
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
  }
  if not opts then
    vim.keymap.set(mode, keys, func, _opts)
  else
    for key, value in pairs(opts) do
      _opts[key] = value
    end
    vim.keymap.set(mode, keys, func, _opts)
  end
end

-- Keymaps for better default experience
--    See `:help vim.keymap.set()`
keymap({ 'n', 'v' }, '<Space>', '<Nop>')

-- Remap for dealing with word wrap
keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Move to active buffer window
keymap('', 'sh', '<C-w>h')
keymap('', 'sj', '<C-w>j')
keymap('', 'sk', '<C-w>k')
keymap('', 'sl', '<C-w>l')
-- keymap('n', '<C-h>', '<C-w>h')
-- keymap('n', '<C-j>', '<C-w>j') -- TODO: conflict
-- keymap('n', '<C-k>', '<C-w>k') -- TODO: conflict
-- keymap('n', '<C-l>', '<C-w>l')
-- keymap('n', '<M-h>', '<C-w>h')
-- keymap('n', '<M-j>', '<C-w>j')
-- keymap('n', '<M-k>', '<C-w>k')
-- keymap('n', '<M-l>', '<C-w>l')

-- Split view
keymap('n', 'ss', ':split<Return><C-w>w', { desc = 'Split window horizontally' })
keymap('n', 'sv', ':vsplit<Return><C-w>w', { desc = 'Split window vertically' })

-- Navigate buffer tabs
keymap('n', '<S-l>', ':bnext<CR>')
keymap('n', '<S-h>', ':bprevious<CR>')

-- -- Resize with arrows
-- keymap('n', '<C-Up>', ':resize -2<CR>')
-- keymap('n', '<C-Down>', ':resize +2<CR>')
-- keymap('n', '<C-Left>', ':vertical resize -2<CR>')
-- keymap('n', '<C-Right>', ':vertical resize +2<CR>')
keymap('n', '<M-Up>', ':resize -2<CR>')
keymap('n', '<M-Down>', ':resize +2<CR>')
keymap('n', '<M-l>', ':vertical resize +2<CR>')
keymap('n', '<M-h>', ':vertical resize -2<CR>')

-- -- Move text up and down
-- keymap('n', '<M-j>', '<Esc>:m .+1<CR>==gi')
-- keymap('n', '<M-k>', '<Esc>:m .-2<CR>==gi')

-- Insert Mode --
-- Press jk fast to exit insert mode
keymap('i', 'jj', '<ESC>')
keymap('i', 'jk', '<ESC>')
keymap('i', 'kk', '<ESC>')
keymap('i', 'kj', '<ESC>')

-- -- Visual --
-- -- Stay in indent mode
-- keymap('v', '<', '<gv')
-- keymap('v', '>', '>gv')

-- -- Move text up and down
keymap('v', '<M-j>', ':m .+1<CR>==')
keymap('v', '<M-k>', ':m .-2<CR>==')
keymap('v', 'p', '"_dP')

-- -- Visual Block --
-- -- Move text up and down
-- keymap('x', 'J', ":move '>+1<CR>gv-gv")
-- keymap('x', 'K', ":move '<-2<CR>gv-gv")
-- keymap('x', '<M-j>', ":move '>+1<CR>gv-gv")
-- keymap('x', '<M-k>', ":move '<-2<CR>gv-gv")

-- -- Terminal --
-- local term_opts = { silent = true }
-- -- Better terminal navigation
-- keymap('t', '<C-h>', '<C-\\><C-N><C-w>h')
-- keymap('t', '<C-j>', '<C-\\><C-N><C-w>j')
-- keymap('t', '<C-k>', '<C-\\><C-N><C-w>k')
-- keymap('t', '<C-l>', '<C-\\><C-N><C-w>l')

---------------------------------------------------------------------------------------------------------
-- Diagnostic keymaps
keymap('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
keymap('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
keymap('n', '<leader>odf', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
keymap('n', '<leader>odl', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
