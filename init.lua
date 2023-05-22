-- If you don't know anything about Lua, I recommend taking some time to read through a guide.
--   And then you can explore or search through `:help lua-guide`
--- User Options ----------------------------------------------------------------------------
require 'user.settings.options'
require 'user.settings.keymaps' -- NOTE: Must set before plugins are required
-- Colorscheme ------------------------------------------------------------------------------
local user_colorscheme = require('user.colorscheme').nightfox.carbonfox
---------------------------------------------------------------------------------------------
-- Install package manager ------------------------------------------------------------------
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
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
-- Install Plugins --------------------------------------------------------------------------
require('lazy').setup { -- NOTE: comment out -> plugins are NOT loaded
  -- [[ Default Plugins ]]
  require 'default.plugins',

  --    Test Plugins
  { import = 'test.plugins' }, -- Enable to automatically import test plugins

  --    Default Optional Plugins
  -- require 'default.plugins.debug',
  require 'default.plugins.git',
  require 'default.plugins.null-ls',
  require 'default.plugins.mason-tool-installer', -- Automatically Install servers for LSP
  -- require 'default.plugins.vimdoc-ja',
  require 'default.plugins.startuptime',

  -- [[ User Plugins ]]
  --    Colorscheme
  require 'user.colorscheme.nightfox',
  -- require 'user.colorscheme.onedark',
  -- require 'user.colorscheme.tokyonight',
  -- require 'user.colorscheme.vscode',

  --    User Interface
  require 'user.plugins.modes',
  require 'user.plugins.lualine',
  require 'user.plugins.bufferline',
  -- require 'user.plugins.nvim-tree',
  require 'user.plugins.neo-tree',

  --    User Optional Plugins
  require 'user.plugins.whichkey',
  require 'user.plugins.colorizer',
  require 'user.plugins.alpha',
  require 'user.plugins.project',
  require 'user.plugins.bbye',
}

-- Settings  --------------------------------------------------------------------------------
-- [[ Set Colorscheme ]]
vim.cmd('colorscheme ' .. user_colorscheme)

-- [[ Default Settings ]]
require 'default.settings.cmp'
require 'default.settings.lsp'
require 'default.settings.telescope'
require 'default.settings.treesitter'

-- [[ User Settings ]]
require 'user.settings.indentline'
require 'user.settings.autocommands'
require 'user.settings.autopairs'
require 'user.settings.autoformat'
require 'user.settings.comment'
require 'user.settings.highlight-on-yank'
-- require 'user.settings._whichkey'

---- modeline -------------------------------------------------------------------------------
--    The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
