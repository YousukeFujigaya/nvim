-- If you don't know anything about Lua, I recommend taking some time to read through
--   a guide. One possible example:
--   - https://learnxinyminutes.com/docs/lua/
--   And then you can explore or search through `:help lua-guide`
---------------------------------------------------------------------------------------------
-- [[ User Options ]]
require 'user.settings.options'
require 'user.settings.keymaps' -- NOTE: Must set before plugins are required (require '_lazy')

-- Colorscheme ------------------------------------------------------------------------------
local user_theme = require('user.colorscheme').nightfox.carbonfox
---------------------------------------------------------------------------------------------

-- Lazy Set Up ------------------------------------------------------------------------------
require '_lazy'
---------------------------------------------------------------------------------------------
--   Install Plugins
require('lazy').setup {
  -- [[ Default Plugins ]]
  require 'default.plugins',

  -- Optional
  require 'default.plugins.git',
  require 'default.plugins.null-ls',
  require 'default.plugins.mason-tool-installer', -- Automatically Install servers for LSP
  -- require 'default.plugins.vimdoc-ja',
  -- require 'default.plugins.startuptime',

  -- [[ User Plugins ]]
  -- Colorscheme
  require 'user.colorscheme.nightfox',
  -- require 'user.colorscheme.onedark',
  -- require 'user.colorscheme.tokyonight',
  -- require 'user.colorscheme.vscode',
  -- require 'user.colorscheme.darkplus',

  -- User Interface
  require 'user.plugins.modes',
  require 'user.plugins.lualine',
  require 'user.plugins.bufferline',
  require 'user.plugins.gitsigns',
  -- require 'user.plugins.nvim-tree', -- TODO: keymapの変更
  require 'user.plugins.filetree',

  -- Optional Plugins
  require 'user.plugins.debug',
  require 'user.plugins.colorizer',
  require 'user.plugins.alpha',
  require 'user.plugins.project',
  require 'user.plugins.bbye',
}

---------------------------------------------------------------------------------------------
-- Settings  --------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
-- [[ Set Colorscheme ]]
vim.cmd('colorscheme ' .. user_theme)

-- [[ Default Settings ]]
require 'default.config.cmp'
require 'default.config.lsp' -- TODO:
require 'default.config.telescope'
require 'default.config.treesitter'
require 'default.config.null-ls'

-- [[ User Settings ]]
require 'user.settings.whichkey'
require 'user.settings.indentline'
require 'user.settings.autocommands'
require 'user.settings.autopairs'
require 'user.settings.autoformat'
require 'user.settings.comment'
require 'user.settings.highlight-on-yank'

---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
