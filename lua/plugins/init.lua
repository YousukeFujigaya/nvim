return {
  -- [[ Base Plugins ]]
  { 'nvim-lua/plenary.nvim', priority = 999 }, -- Usefful lua functions used by lots of plugins
  { 'folke/neodev.nvim', priority = 999, opts = {} }, -- Additional lua configuration, makes nvim stuff amazing!
  { 'tpope/vim-sleuth', event = 'InsertEnter' }, -- Detect tabstop and shiftwidth automatically
  { 'nvim-tree/nvim-web-devicons', lazy = true },
  { 'windwp/nvim-autopairs', event = 'InsertEnter' },
  { 'lukas-reineke/indent-blankline.nvim', event = { 'BufRead', 'BufNewFile' } },
  { 'numToStr/Comment.nvim', keys = 'gc', dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' } },
  { 'norcalli/nvim-colorizer.lua', event = { 'BufRead', 'BufNewFile' }, opts = {} },
  { 'ruanyl/vim-gh-line' }, -- Open the Git file in browser
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufRead', 'BufNewFile' },
    opts = {
      signs = {
        -- See `:help gitsigns.txt`
        add = { hl = 'GitSignsAdd', text = ' ▎', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
        change = { hl = 'GitSignsChange', text = ' ▎', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
        delete = { hl = 'GitSignsDelete', text = '▶︎', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
        topdelete = { hl = 'GitSignsDelete', text = '▶︎', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
        changedelete = { hl = 'GitSignsChange', text = ' ▎', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', '[c', require('gitsigns').prev_hunk, { buffer = bufnr, desc = 'Go to Previous Hunk' })
        vim.keymap.set('n', ']c', require('gitsigns').next_hunk, { buffer = bufnr, desc = 'Go to Next Hunk' })
        vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[P]review [H]unk' })
      end,
    },
  },

  {
    'junegunn/fzf.vim',
    event = { 'CmdlineEnter' },
    cmd = { 'Files', 'Rg', 'Commits' },
    dependencies = 'junegunn/fzf',
    config = function()
      if os.getenv 'TMUX' then
        vim.g.fzf_layout = { tmux = '-p100%,96%' }
      else
        vim.g.fzf_layout = { down = '100%' }
      end

      vim.g.fzf_colors = {
        -- fg = { 'fg', 'Normal' },
        -- bg = { 'bg', 'Normal' },
        -- hl = { 'fg', 'Comment' },
        ['fg+'] = { 'fg', 'CursorLine', 'CursorColumn', 'Normal' },
        ['bg+'] = { 'bg', 'CursorLine', 'CursorColumn' },
        ['hl+'] = { 'fg', 'Statement' },
        -- info = { 'fg', 'PreProc' },
        -- prompt = { 'fg', 'Conditional' },
        -- pointer = { 'fg', 'Exception' },
        -- marker = { 'fg', 'Keyword' },
        -- spinner = { 'fg', 'Label' },
        -- header = { 'fg', 'Comment' },
      }

      vim.g.fzf_action = {
        ['ctrl-t'] = 'tab split',
        ['ctrl-b'] = 'split',
        ['ctrl-v'] = 'vsplit',
        ['ctrl-y'] = function(lines)
          vim.fn.setreg('*', table.concat(lines, '\n'))
        end,
      }

      --  [Buffers] Jump to the existing window if possible
      vim.g.fzf_buffers_jump = 1
    end,
  },

  {
    'ptzz/lf.vim',
    cmd = 'Lf',
    dependencies = 'voldikss/vim-floaterm',
    config = function()
      vim.g.lf_map_keys = 0
      vim.g.lf_width = 160
      vim.g.lf_height = 40
    end,
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
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', event = 'LspAttach' },
      { 'williamboman/mason-lspconfig.nvim', event = 'LspAttach' },
      { 'j-hui/fidget.nvim', event = 'LspAttach', opts = {} },
    },
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    event = { 'BufEnter', 'InsertEnter' },
    config = function()
      local null_ls = require 'null-ls'
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      local formatting = null_ls.builtins.formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      -- local diagnostics = null_ls.builtins.diagnostics

      null_ls.setup {
        debug = false,
        sources = {
          formatting.prettier.with { extra_args = { '--no-semi', '--single-quote', '--jsx-single-quote' } },
          formatting.black.with { extra_args = { '--fast' } },
          formatting.stylua,
        },
      }
    end,
  },
  { -- Automatically Install servers for LSP
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    event = { 'BufRead', 'BufEnter' },
    config = function()
      require('mason-tool-installer').setup {
        ensure_installed = {
          -- Lsp
          { 'lua-language-server', auto_update = true },
          'vim-language-server',
          'bash-language-server',
          'typescript-language-server',
          'html-lsp',
          'css-lsp',
          'json-lsp',
          'pyright',
          'rust-analyzer',

          -- Formatter
          'prettier',
          'stylua',
          'black',
          'yamlfmt',

          -- Linter
          -- "mypy",
          -- 'misspell',

          -- Diagnostics
          -- 'cspell',

          -- Dap
          -- "debugpy",
        },
      }
    end,
  },

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    cmd = 'Telescope',
    dependencies = {
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make', -- Only load if `make` is available. Make sure you have the system requirements installed.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      {
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
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter-textobjects', event = { 'BufRead', 'BufNewFile' } },
    },
    build = ':TSUpdate',
  },
}
