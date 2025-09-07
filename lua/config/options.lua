-- General settings for modern Neovim experience

local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

-- UI
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Splits
opt.splitbelow = true
opt.splitright = true

-- Backup and undo
opt.backup = false
opt.writebackup = false
opt.undofile = true

-- Update time
opt.updatetime = 250
opt.timeoutlen = 300

-- Completion
opt.completeopt = "menuone,noselect"

-- Mouse
opt.mouse = "a"

-- Clipboard
opt.clipboard = "unnamedplus"

-- File encoding
opt.fileencoding = "utf-8"

-- Show invisible characters
opt.list = true
opt.listchars = {
  tab = "→ ",
  trail = "·",
  extends = "»",
  precedes = "«",
  nbsp = "⎵",
}

-- Folding
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false

-- Window title
opt.title = true

-- Confirm to save changes before exiting modified buffer
opt.confirm = true

-- Hide * markup for bold and italic
opt.conceallevel = 3