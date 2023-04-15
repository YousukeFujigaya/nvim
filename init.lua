-- If you don't know anything about Lua, I recommend taking some time to read through
--   a guide. One possible example:
--   - https://learnxinyminutes.com/docs/lua/
--   And then you can explore or search through `:help lua-guide`
---------------------------------------------------------------------------------------------
-- Lazy Set Up
require '_lazy'
require 'plugins'
---------------------------------------------------------------------------------------------
-- User Options
require 'user.options'
require 'user.keymaps'
---------------------------------------------------------------------------------------------
-- Colorscheme
local theme = require 'user.theme'
local colorscheme = theme.carbonfox
local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not status_ok then
  return
end
---------------------------------------------------------------------------------------------
-- Plugins
require 'user.cmp'
require 'user.lsp' -- TODO:
require 'user.telescope'
require 'user.gitsigns'
require 'user.treesitter'
require 'user.autopairs'
require 'user.comment'
require 'user.nvim-tree' -- TODO: keymapの変更
require 'user.bufferline'
require 'user.lualine'
require 'user.indentline'
require 'user.project'
-- require 'user.impatient'
require 'user.alpha'
require 'user.whichkey'
require 'user.autocommands'
require 'user.autoformat'
require 'user.modes'
---------------------------------------------------------------------------------------------
-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
---------------------------------------------------------------------------------------------

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
