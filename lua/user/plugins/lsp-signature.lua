return {
  'ray-x/lsp_signature.nvim',
  event = 'InsertEnter',
  config = function()
    local opts = {
      bind = true,
      handler_opts = {
        border = 'rounded',
      },
      hint_prefix = '💡',
    }

    require('lsp_signature').setup(opts)
    require('lsp_signature').on_attach(opts, bufnr)
  end,
}
