-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
return {
  { 'nvim-lua/plenary.nvim', priority = 999 }, -- Usefful lua functions used by lots of plugins
  { 'folke/neodev.nvim', priority = 999, opts = true }, -- Additional lua configuration, makes nvim stuff amazing!
  { 'tpope/vim-sleuth', event = 'InsertEnter' }, -- Detect tabstop and shiftwidth automatically
  { 'nvim-tree/nvim-web-devicons', lazy = true },
  { 'windwp/nvim-autopairs', event = 'InsertEnter' }, -- Autopairs, integrates with both cmp and treesitter
  { 'lukas-reineke/indent-blankline.nvim', event = { 'BufRead', 'BufNewFile' } }, -- Add indentation guides even on blank lines
  {
    'numToStr/Comment.nvim', -- "gc" to comment visual regions/lines
    keys = 'gc',
    dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
  },

  -- Autocompletion (Cmp)
  {
    'hrsh7th/nvim-cmp', -- The completion plugins
    event = 'InsertEnter',
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' }, -- buffer completions
      { 'hrsh7th/cmp-path' }, -- path completions
      { 'hrsh7th/cmp-cmdline', event = 'CmdlineEnter' }, -- command completions
      { 'L3MON4D3/LuaSnip' }, -- snippet engine
      { 'saadparwaiz1/cmp_luasnip' }, -- snippet completions
      { 'rafamadriz/friendly-snippets' }, -- a bunch of snippets to use
      { 'hrsh7th/cmp-nvim-lua' },
    },
  },

  -- LSP (Language Server Protocol)
  {
    'neovim/nvim-lspconfig', -- enable LSP
    dependencies = {
      { 'williamboman/mason.nvim', event = 'LspAttach' }, -- simple to use language server installer
      { 'williamboman/mason-lspconfig.nvim', event = 'LspAttach' }, -- Useful status updates for LSP
      { 'j-hui/fidget.nvim', event = 'LspAttach', opts = true }, -- Useful status updates for LSP
    },
  },

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    cmd = 'Telescope',
    dependencies = {
      { -- Fuzzy Finder Algorithm which requires local dependencies to be built.
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make', -- Only load if `make` is available. Make sure you have the system requirements installed.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { -- regrep which requires local dependencies to be built.
        'nvim-telescope/telescope-live-grep-args.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },

  -- Treesitter
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter-textobjects', event = { 'BufRead', 'BufNewFile' } },
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

  -- { import = 'test.plugins' }, -- Enable to automatically import test plugins,
}
