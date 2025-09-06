--- User Options ----------------------------------------------------------------------------
require 'user.settings.options'
require 'user.settings.keymaps'

-- Install Plugins --------------------------------------------------------------------------
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup({
  require 'plugins',

  { import = 'user.plugins' }, -- Enable to automatically import user plugins

  -- [[ Colorscheme ]]
  require 'user.colorscheme.theme',
  require 'user.colorscheme.modes',
  -- [[ User Interface ]]
  require 'user.interface.lualine',
  require 'user.interface.bufferline',
  require 'user.interface.neo-tree',
}, {})

-- Settings ---------------------------------------------------------------------------------
-- [[ Set Colorscheme ]]
vim.cmd.colorscheme 'carbonfox'

-- [[ Base Settings ]]
require 'settings.cmp'
require 'settings.lsp'
require 'settings.treesitter'
require 'settings.telescope'

-- [[ User Settings ]]
require 'user.settings.indentline'
require 'user.settings.autocommands'
require 'user.settings.autopairs'
require 'user.settings.autoformat'
require 'user.settings.comment'
require 'user.settings.highlight-on-yank'

---- modeline -------------------------------------------------------------------------------
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
