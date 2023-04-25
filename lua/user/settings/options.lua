-- [[ Setting options ]]
-- See `:help vim.o`

vim.opt.backup = false -- Create a backup file

-- encoding
vim.o.encofing = 'utf-8'
vim.scriptencoding = 'utf-8'

vim.opt.swapfile = false -- Create a swapfile
vim.opt.writebackup = false -- If a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.undofile = true -- Enable persistent undo

vim.opt.helplang = { 'ja', 'en' }
vim.o.termguicolors = true -- Set term gui colors (most terminals support this)
-- NOTE: You should make sure your terminal supports this
vim.o.mouse = 'a' -- Allow the mouse to be used in neovim
vim.o.clipboard = 'unnamedplus' -- Sync clipboard between OS and Neovim
vim.opt.cmdheight = 1 -- More space in the neovim command line for displaying messages
vim.o.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.wo.number = true -- Make line numbers default
vim.opt.relativenumber = false -- Set relative numbered lines
vim.opt.numberwidth = 4 -- set number column width to 2 {default 4}
vim.opt.cursorline = true -- Highlight the current line
vim.o.hlsearch = true -- Highlight all matches on previous search pattern
-- Tips: '<leader>h' = 'No highlight'
--  [*] -> highlight a word on cursor
--  'n','N' -> (highlight and) next or preveous the same word
vim.o.ignorecase = true -- Ignore case in search patterns
vim.o.smartcase = true
vim.opt.smartindent = true -- Make indenting smarter again
vim.o.breakindent = true -- Enable break indent
vim.opt.pumheight = 10 -- Pop up menu height
vim.opt.showmode = false -- We don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 2 -- Always show tabs
vim.opt.splitbelow = true -- Force all horizontal splits to go below current window
vim.opt.splitright = true -- Force all vertical splits to go to the right of current window
vim.wo.signcolumn = 'yes' -- Keep signcolumn on by default

-- Decrease update time
vim.o.updatetime = 300
vim.o.timeout = true
vim.o.timeoutlen = 300

vim.opt.wrap = true -- display lines as one long line
vim.opt.linebreak = true -- Companion to wrap, don't split words
vim.opt.scrolloff = 8 -- minimal number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 8 -- minimal number of screen columns either side of cursor if wrap is `false`
-- vim.opt.guifont = 'monospace:h17' -- the font used in graphical neovim applications
-- vim.opt.whichwrap = 'bs<>[]hl' -- which "horizontal" keys are allowed to travel to prev/next line

-----------------------------------------------------------------------

-- float-transparent
-- vim.opt.winblend = 5

-- vim.o.background = 'dark' -- Set backgroundcolor

-- ファイルを開いた時に、カーソルの場所を復元する
-- vim.api.nvim_create_autocmd({ "BufReadPost" }, {
-- 	pattern = { "*" },
-- 	callback = function()
-- 		vim.api.nvim_exec('silent! normal! g`"zv', false)
-- 	end,
-- })
