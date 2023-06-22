vim.o.encofing = 'utf-8'
vim.scriptencoding = 'utf-8'
vim.o.fileencoding = 'utf-8'
vim.opt.shell = 'zsh'
vim.opt.swapfile = false
vim.opt.backup = false -- Create a backup file
vim.opt.writebackup = false
vim.opt.undofile = true -- Enable persistent undo

vim.opt.helplang = { 'ja', 'en' }
vim.opt.fillchars:append { diff = '╱' }
vim.o.termguicolors = true -- Set term gui colors (most terminals support this)
vim.o.mouse = 'a' -- Allow the mouse to be used in neovim
vim.o.clipboard = 'unnamedplus' -- Sync clipboard between OS and Neovim
vim.opt.cmdheight = 1 -- More space in the neovim command line for displaying messages
vim.o.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.wo.number = true -- Make line numbers default
vim.wo.relativenumber = true -- Set relative numbered lines
vim.opt.numberwidth = 4 -- set number column width to 2 {default 4}
vim.opt.cursorline = true -- Highlight the current line
vim.o.hlsearch = true -- Highlight all matches on previous search pattern
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
vim.opt.wrap = true
vim.opt.scrolloff = 8 -- minimal number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 8 -- minimal number of screen columns either side of cursor if wrap is `false`
vim.opt.ambiwidth = 'single'

-- Decrease update time
vim.o.updatetime = 300
vim.o.timeout = true
vim.o.timeoutlen = 300

-- float-transparent
vim.opt.winblend = 10
vim.opt.pumblend = 30

-- ファイルを開いた時に、カーソルの場所を復元する
-- vim.api.nvim_create_autocmd({ "BufReadPost" }, {
-- 	pattern = { "*" },
-- 	callback = function()
-- 		vim.api.nvim_exec('silent! normal! g`"zv', false)
-- 	end,
-- })
