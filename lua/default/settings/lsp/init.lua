local status_ok, _ = pcall(require, 'lspconfig')
if not status_ok then
  return
end

require 'default.settings.lsp.mason'
require('default.settings.lsp.handlers').setup()
