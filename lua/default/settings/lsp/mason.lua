-- Mason settings.
-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
  -- vimls = {}, -- 'vim-language-server'
  -- bashls = {}, -- 'bash-language-server'
  -- tsserver = {}, -- 'typescript-language-server'
  -- html = {}, --'html-lsp'
  -- cssls = {}, -- 'css-lsp'
  -- jsonls = {}, --'json-lsp'
  -- pyright = {}, -- 'pyright'
  -- rust_analyzer = {}, -- 'rust-language-server'
  -- yamlls = {}, -- 'yaml-language-server'
}

local settings = {
  ui = {
    -- Whether to automatically check for new versions when opening the :Mason window.
    check_outdated_packages_on_open = true,

    -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
    border = 'none',

    -- Width of the window. Accepts:
    -- - Integer greater than 1 for fixed width.
    -- - Float in the range of 0-1 for a percentage of screen width.
    width = 0.8,

    -- Height of the window. Accepts:
    -- - Integer greater than 1 for fixed height.
    -- - Float in the range of 0-1 for a percentage of screen height.
    height = 0.9,

    icons = {
      -- package_installed = '◍',
      -- package_pending = '◍',
      -- package_uninstalled = '◍',
      package_installed = '✓',
      package_pending = '➜',
      package_uninstalled = '◍',
    },

    keymaps = {
      -- Keymap to expand a package
      toggle_package_expand = '<CR>',
      -- Keymap to install the package under the current cursor position
      install_package = 'i',
      -- Keymap to reinstall/update the package under the current cursor position
      update_package = 'u',
      -- Keymap to check for new version for the package under the current cursor position
      check_package_version = 'c',
      -- Keymap to update all installed packages
      update_all_packages = 'U',
      -- Keymap to check which installed packages are outdated
      check_outdated_packages = 'C',
      -- Keymap to uninstall a package
      uninstall_package = 'X',
      -- Keymap to cancel a package installation
      cancel_installation = '<C-c>',
      -- Keymap to apply language filter
      apply_language_filter = '<C-f>',
    },
  },
}

require('mason').setup(settings)

local status_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not status_ok then
  return
end
mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
  automatic_installation = true,
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = require('default.settings.lsp.handlers').capabilities,
      on_attach = require('default.settings.lsp.handlers').on_attach,
      settings = servers[server_name],
    }
  end,
}
