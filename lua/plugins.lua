-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup {
  { 'folke/lazy.nvim' }, -- Have lazy manage itself
  { 'nvim-lua/plenary.nvim' }, -- Usefful lua functions used by lots of plugins
  { 'folke/which-key.nvim', event = 'VeryLazy' }, -- Useful plugin to show you pending keybinds.
  { 'windwp/nvim-autopairs', event = 'InsertEnter' }, -- Autopairs, integrates with both cmp and treesitter
  { 'numToStr/Comment.nvim', event = 'InsertEnter' }, -- "gc" to comment visual regions/lines
  -- { 'JoosepAlviste/nvim-ts-context-commentstring', event = { 'InsertEnter' } }, -- -> comment out
  { 'nvim-tree/nvim-web-devicons' },
  { 'kyazdani42/nvim-tree.lua', cmd = 'NvimTreeToggle' },
  { 'nvim-lualine/lualine.nvim' }, -- Set lualine as statusline
  { 'akinsho/bufferline.nvim' },

  -- Colorschemes
  { 'EdenEast/nightfox.nvim', lazy = false, priority = 1000 },

  -- Highlight
  { 'lukas-reineke/indent-blankline.nvim', event = 'InsertEnter' }, -- Add indentation guides even on blank lines
  { 'mvllow/modes.nvim' },
  -- { 'RRethy/vim-illuminate', event = 'VeryLazy' }, -- Highlight words on your cursor 重い

  -- Autocompletion (Cmp)
  {
    'hrsh7th/nvim-cmp', -- The completion plugins
    event = 'InsertEnter',
    module = 'cmp',
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp', event = 'InsertEnter' },
      { 'hrsh7th/cmp-buffer', event = 'InsertEnter' }, -- buffer completions
      { 'hrsh7th/cmp-path', event = 'InsertEnter' }, -- path completions
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
      { 'williamboman/mason.nvim', opts = true }, -- simple to use language server installer
      { 'williamboman/mason-lspconfig.nvim' }, -- Useful status updates for LSP
      { 'j-hui/fidget.nvim', event = 'VeryLazy', opts = true }, -- Useful status updates for LSP
      { 'folke/neodev.nvim', event = 'VeryLazy', opts = true }, -- Additional lua configuration, makes nvim stuff amazing!
      { 'jose-elias-alvarez/null-ls.nvim', event = 'BufEnter' }, -- for formatters and linters
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
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter-textobjects' },
    },
    config = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },

  -- Git
  { -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    event = { 'BufNewFile, BufRead' },
    -- opts = {
    --   -- See `:help gitsigns.txt`
    --   signs = {
    --     add = { text = '+' },
    --     change = { text = '~' },
    --     delete = { text = '_' },
    --     topdelete = { text = '‾' },
    --     changedelete = { text = '~' },
    --   },
    -- },
  },
  { 'tpope/vim-fugitive', event = 'CmdlineEnter' }, -- Enable to use git commands
  { 'tpope/vim-rhubarb', event = 'CmdlineEnter' }, -- Open the Git file in browser
  { 'tpope/vim-sleuth' }, -- Detect tabstop and shiftwidth automatically

  -- Debug
  {
    'mfussenegger/nvim-dap',
    -- NOTE: And you can specify dependencies as well
    dependencies = {
      -- Creates a beautiful debugger UI
      { 'rcarriga/nvim-dap-ui' },

      -- Installs the debug adapters for you
      { 'williamboman/mason.nvim' },
      { 'jay-babu/mason-nvim-dap.nvim' },

      -- Add your own debuggers here
      -- { 'leoluz/nvim-dap-go' },
    },
  },

  -- Optional
  -- { 'delphinus/auto-cursorline.nvim', opts = { wait_ms = 0.1 } },
  { 'dstein64/vim-startuptime', cmd = 'StartupTime' },
  { 'vim-jp/vimdoc-ja', ft = 'help' },
  { 'WhoIsSethDaniel/mason-tool-installer.nvim' },
  { 'goolord/alpha-nvim' },
  { 'ahmedkhalf/project.nvim', event = { 'BufRead', 'BufNewFile' } },
  -- { 'lewis6991/impatient.nvim' }, -- Speed up loading Lua modules in Neovim to improve startup time.
  { 'moll/vim-bbye', event = 'CmdlineEnter' }, --delete buffers without closing your windows or messing up your layout

  -- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
  --       These are some example plugins that I've included in the kickstart repository.
  --       Uncomment any of the lines below to enable them.
  -- require 'kickstart.plugins.autoformat',
  -- require 'kickstart.plugins.debug',

  -- NOTE: The import below automatically adds your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    You can use this folder to prevent any conflicts with this init.lua if you're interested in keeping
  --    up-to-date with whatever is in the kickstart repo.
  --
  --    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
  --
  --    An additional note is that if you only copied in the `init.lua`, you can just comment this line
  --    to get rid of the warning telling you that there are not plugins in `lua/custom/plugins/`.
  -- { import = "custom.plugins" },
}
