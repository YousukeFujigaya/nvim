local status_ok, _ = pcall(require, 'lspconfig')
if not status_ok then
  return
end

require 'default.config.lsp.mason'
require('default.config.lsp.handlers').setup()
require 'default.config.lsp.null-ls'
