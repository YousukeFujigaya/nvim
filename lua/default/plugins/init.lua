-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
return {
  { 'nvim-lua/plenary.nvim' }, -- Usefful lua functions used by lots of plugins
  -- { 'folke/which-key.nvim', event = 'VeryLazy' }, -- Useful plugin to show you pending keybinds.
  { 'windwp/nvim-autopairs', event = 'InsertEnter' }, -- Autopairs, integrates with both cmp and treesitter
  { -- "gc" to comment visual regions/lines
    'numToStr/Comment.nvim',
    event = 'InsertEnter',
    dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
  },
  { 'nvim-tree/nvim-web-devicons' },
  { 'lukas-reineke/indent-blankline.nvim', event = 'InsertEnter' }, -- Add indentation guides even on blank lines
  { 'tpope/vim-sleuth' }, -- Detect tabstop and shiftwidth automatically

  -- Autocompletion (Cmp)
  {
    'hrsh7th/nvim-cmp', -- The completion plugins
    event = { 'InsertEnter', 'CmdlineEnter' },
    -- module = 'cmp',
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp', event = 'InsertEnter' },
      { 'hrsh7th/cmp-buffer', event = 'InsertEnter' }, -- buffer completions
      { 'hrsh7th/cmp-path', event = { 'InsertEnter', 'CmdlineEnter' } }, -- path completions
      { 'hrsh7th/cmp-cmdline', event = 'CmdlineEnter' }, -- command completions
      { 'L3MON4D3/LuaSnip', event = 'InsertEnter' }, -- snippet engine
      { 'saadparwaiz1/cmp_luasnip', event = 'InsertEnter' }, -- snippet completions
      { 'rafamadriz/friendly-snippets', event = 'InsertEnter' }, -- a bunch of snippets to use
      { 'hrsh7th/cmp-nvim-lua', event = 'InsertEnter' },
    },
  },

  -- LSP (Language Server Protocol)
  {
    'neovim/nvim-lspconfig', -- enable LSP
    dependencies = {
      { 'williamboman/mason.nvim' }, -- simple to use language server installer
      { 'williamboman/mason-lspconfig.nvim' }, -- Useful status updates for LSP
      { 'j-hui/fidget.nvim', event = 'VeryLazy', opts = true }, -- Useful status updates for LSP
      { 'folke/neodev.nvim', event = 'VeryLazy', opts = true }, -- Additional lua configuration, makes nvim stuff amazing!
    },
  },

  -- Telescope
  { 'nvim-telescope/telescope.nvim', version = '*', cmd = 'Telescope' },
  { -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    'nvim-telescope/telescope-fzf-native.nvim',
    -- Only load if `make` is available. Make sure you have the system requirements installed.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },
  { 'nvim-telescope/telescope-live-grep-args.nvim' },

  -- Treesitter
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter-textobjects' },
    },
    -- config = function()
    --   pcall(require('nvim-treesitter.install').update { with_sync = true })
    -- end,
  },

  -- NOTE: The import below automatically adds your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    You can use this folder to prevent any conflicts with this init.lua if you're interested in keeping
  --    up-to-date with whatever is in the kickstart repo.
  --
  --    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
  --
  -- { import = 'custom.plugins' },

  -- { import = 'test.plugins' }, -- Enable to automatically import test plugins
}
-- , {}
