local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
  return
end

lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      completion = {
        callSnippet = 'Replace',
      },
    },
  },
}

require 'default.settings.lsp.mason'
require('default.settings.lsp.handlers').setup()
