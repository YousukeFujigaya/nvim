return { -- Git related plugins
  {
    'dinhhuy258/git.nvim',
    event = 'CmdlineEnter',
    config = function()
      require('git').setup {
        default_mappings = true, -- NOTE: `quit_blame` and `blame_commit` are still merged to the keymaps even if `default_mappings = false`

        keymaps = {
          -- Open blame window
          blame = '<Leader>gb',
          -- Close blame window
          quit_blame = 'q',
          -- Open blame commit
          blame_commit = '<CR>',
          -- Open file/folder in git repository
          browse = '<Leader>go',
          -- Open pull request of the current branch
          open_pull_request = '<Leader>gp',
          -- Create a pull request with the target branch is set in the `target_branch` option
          create_pull_request = '<Leader>gn',
          -- Opens a new diff that compares against the current index
          diff = '<Leader>gd',
          -- Close git diff
          diff_close = '<Leader>gD',
          -- Revert to the specific commit
          revert = '<Leader>gr',
          -- Revert the current file to the specific commit
          revert_file = '<Leader>gR',
        },
        -- Default target branch when create a pull request
        target_branch = 'main',
      }
    end,
  }, -- Enable to use git commands
  { 'tpope/vim-rhubarb', event = 'CmdlineEnter' }, -- Open the Git file in browser
  {
    'lewis6991/gitsigns.nvim', -- Adds git releated signs to the gutter, as well as utilities for managing changes
    event = { 'BufRead', 'BufNewFile' },
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
    config = function()
      require('gitsigns').setup {
        signs = {
          -- See `:help gitsigns.txt`
          -- add = { text = ' +' },
          -- change = { text = ' ~' },
          -- delete = { text = ' _' },
          -- topdelete = { text = ' ‾' },
          -- changedelete = { text = ' ~' },
          add = { hl = 'GitSignsAdd', text = ' ▎', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
          change = { hl = 'GitSignsChange', text = ' ▎', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
          delete = { hl = 'GitSignsDelete', text = '▶︎', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
          topdelete = { hl = 'GitSignsDelete', text = '▶︎', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
          changedelete = { hl = 'GitSignsChange', text = ' ▎', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
        },
        signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
        numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir = {
          interval = 1000,
          follow_files = true,
        },
        attach_to_untracked = true,
        current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
          delay = 1000,
          ignore_whitespace = false,
        },
        current_line_blame_formatter_opts = {
          relative_time = false,
        },
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        max_file_length = 40000,
        preview_config = {
          -- Options passed to nvim_open_win
          border = 'single',
          style = 'minimal',
          relative = 'cursor',
          row = 0,
          col = 1,
        },
        yadm = {
          enable = false,
        },
      }
    end,
  },
}
