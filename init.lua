-- If you don't know anything about Lua, I recommend taking some time to read through
--   a guide. One possible example:
--   - https://learnxinyminutes.com/docs/lua/
--   And then you can explore or search through `:help lua-guide`
---------------------------------------------------------------------------------------------
-- [[ User Options ]]
require 'user.settings.options'
require 'user.settings.keymaps' -- NOTE: Must set before plugins are required (require '_lazy')
---------------------------------------------------------------------------------------------
-- [[ Lazy Set Up ]]
require '_lazy'
---------------------------------------------------------------------------------------------
-- [[ Install Plugins ]]
---------------------------------------------------------------------------------------------
require('lazy').setup {
  -- [[ Default Plugins ]]
  require 'default.plugins',
  -- { import = 'test' }, -- New Plugin Test

  -- Options
  require 'default.plugins.mason-tool-installer', -- Automatically Installed plugins related Mason
  require 'default.plugins.options',

  ---------------------------------------------------------------------------------------------
  -- [[ User Plugins ]]
  -- Colorscheme
  require 'user.colorscheme.nightfox',
  -- require 'user.colors.onedark',

  -- User Interface
  require 'user.plugins.modes',
  require 'user.plugins.lualine',
  require 'user.plugins.bufferline',
  require 'user.plugins.gitsigns',
  require 'user.plugins.nvim-tree', -- TODO: keymapの変更

  -- User Plugins
  require 'user.plugins.impatient',
  require 'user.plugins.debug',
  require 'user.plugins.alpha',
  require 'user.plugins.project',
  require 'user.plugins.bbye',
}
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
-- Colorscheme
local theme = require 'user.colorscheme.theme'
local colorscheme = theme.carbonfox
local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not status_ok then
  return
end
---------------------------------------------------------------------------------------------
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
require 'user.settings.highlight_on_yank'
---------------------------------------------------------------------------------------------
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
