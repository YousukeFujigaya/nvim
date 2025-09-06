return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    -- event = 'CmdlineEnter',
    keys = { { '<leader>e', '<cmd>NeoTreeFocusToggle<CR>', desc = 'Explorer' } },
    cmd = 'NeoTreeFocusToggle',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-tree/nvim-web-devicons' }, -- not strictly required, but recommended
      { 'MunifTanjim/nui.nvim' },

      -- only needed if you want to use the commands with "_with_window_picker" suffix
      -- {
      --   's1n7ax/nvim-window-picker',
      --   tag = 'v1.*',
      --   config = function()
      --     require('window-picker').setup {
      --       autoselect_one = true,
      --       include_current = false,
      --       filter_rules = {
      --         -- filter using buffer options
      --         bo = {
      --           -- if the file type is one of following, the window will be ignored
      --           filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },
      --           -- if the buffer type is one of following, the window will be ignored
      --           buftype = { 'terminal', 'quickfix' },
      --         },
      --       },
      --       other_win_hl_color = '#e35e4f',
      --     }
      --   end,
      -- },
    },
    config = function()
      -- Unless you are still migrating, remove the deprecated commands from v1.x
      vim.cmd [[ let g:neo_tree_remove_legacy_commands = 1 ]]

      -- If you want icons for diagnostic errors, you'll need to define them somewhere:
      vim.fn.sign_define('DiagnosticSignError', { text = ' ', texthl = 'DiagnosticSignError' })
      vim.fn.sign_define('DiagnosticSignWarn', { text = ' ', texthl = 'DiagnosticSignWarn' })
      vim.fn.sign_define('DiagnosticSignInfo', { text = ' ', texthl = 'DiagnosticSignInfo' })
      vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })
      -- NOTE: this is changed from v1.x, which used the old style of highlight groups
      -- in the form "LspDiagnosticsSignWarning"

      require('neo-tree').setup {
        -- If a user has a sources list it will replace this one.
        -- Only sources listed here will be loaded.
        -- You can also add an external source by adding it's name to this list.
        -- The name used here must be the same name you would use in a require() call.
        sources = {
          'filesystem',
          'buffers',
          'git_status',
          -- "document_symbols",
        },
        add_blank_line_at_top = true, -- Add a blank line at the top of the tree.
        auto_clean_after_session_restore = true, -- Automatically clean up broken neo-tree buffers saved in sessions
        -- popup_border_style is for input and confirmation dialogs.
        -- Configurtaion of floating window is done in the individual source sections.
        -- "NC" is a special style that works well with NormalNC set
        close_floats_on_escape_key = true,
        default_source = 'filesystem',
        enable_diagnostics = true,
        enable_git_status = true,
        enable_modified_markers = false, -- Show markers for files with unsaved changes.
        enable_opened_markers = true, -- Enable tracking of opened files. Required for `components.name.highlight_opened_files`
        enable_refresh_on_write = true, -- Refresh the tree when a file is written. Only used if `use_libuv_file_watcher` is false.
        git_status_async = true,
        -- These options are for people with VERY large git repos
        git_status_async_options = {
          batch_size = 1000, -- how many lines of git status results to process at a time
          batch_delay = 10, -- delay in ms between batches. Spreads out the workload to let other processes run.
          max_lines = 10000, -- How many lines of git status results to process. Anything after this will be dropped.
          -- Anything before this will be used. The last items to be processed are the untracked files.
        },
        hide_root_node = true, -- Hide the root node.
        retain_hidden_root_indent = true, -- IF the root node is hidden, keep the indentation anyhow.
        -- This is needed if you use expanders because they render in the indent.
        log_level = 'info', -- "trace", "debug", "info", "warn", "error", "fatal"
        log_to_file = false, -- true, false, "/path/to/file.log", use :NeoTreeLogs to show the file
        open_files_in_last_window = true, -- false = open files in top left window
        open_files_do_not_replace_types = { 'terminal', 'trouble', 'qf' }, -- when opening files, do not use windows containing these filetypes or buftypes
        popup_border_style = 'rounded', -- "double", "none", "rounded", "shadow", "single" or "solid"
        -- popup_border_style = 'rounded',
        resize_timer_interval = 500, -- in ms, needed for containers to redraw right aligned and faded content
        -- set to -1 to disable the resize timer entirely
        --                           -- NOTE: this will speed up to 50 ms for 1 second following a resize
        sort_case_insensitive = false, -- used when sorting files and directories in the tree
        sort_function = nil, -- uses a custom function for sorting files and directories in the tree
        use_popups_for_input = true, -- If false, inputs will use vim.ui.input() instead of custom floats.
        use_default_mappings = true,
        close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
        -- sort_function = function (a,b)
        --       if a.type == b.type then
        --           return a.path > b.path
        --       else
        --           return a.type > b.type
        --       end
        --   end , -- this sorts files and directories descendantly

        default_component_configs = {
          container = {
            enable_character_fade = true,
            width = '100%',
            right_padding = 0,
          },
          indent = {
            indent_size = 2,
            padding = 1, -- extra padding on left hand side
            -- indent guides
            with_markers = true,
            indent_marker = '│',
            last_indent_marker = '└',
            highlight = 'NeoTreeIndentMarker',
            -- expander config, needed for nesting files
            with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
            expander_collapsed = '',
            expander_expanded = '',
            expander_highlight = 'NeoTreeExpander',
          },
          diagnostics = {
            symbols = {
              hint = '',
              info = ' ',
              warn = ' ',
              error = ' ',
            },
            highlights = {
              hint = 'DiagnosticSignHint',
              info = 'DiagnosticSignInfo',
              warn = 'DiagnosticSignWarn',
              error = 'DiagnosticSignError',
            },
          },
          icon = {
            folder_closed = '',
            folder_open = '',
            folder_empty = '',
            -- folder_empty = 'ﰊ',
            -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
            -- then these will never be used.
            default = '*',
            highlight = 'NeoTreeFileIcon',
          },
          modified = {
            symbol = '',
            highlight = 'NeoTreeModified',
          },
          name = {
            trailing_slash = false,
            highlight_opened_files = true, -- Requires `enable_opened_markers = true`.
            -- Take values in { false (no highlight), true (only loaded),
            -- "all" (both loaded and unloaded)}. For more information,
            -- see the `show_unloaded` config of the `buffers` source.
            use_git_status_colors = false,
            highlight = 'NeoTreeFileName',
          },
          git_status = {
            symbols = {
              -- Change type
              added = ' ',
              modified = ' ',
              deleted = ' ',
              renamed = '➜',
              -- Status type
              untracked = '',
              ignored = '◌',
              unstaged = '✗',
              staged = '✓',
              conflict = '',
            },
          },
        },
        renderers = {
          directory = {
            { 'indent', content = { { 'name', zindex = 10 } } },
            { 'icon' },
            { 'current_filter' },
            {
              'container',
              content = {
                { 'name', zindex = 10 },
                { 'symlink_target', zindex = 10, highlight = 'NeoTreeSymbolicLinkTarget' },
                { 'clipboard', zindex = 10 },
              },
            },
          },
          file = {
            { 'indent' },
            { 'icon' },
            {
              'container',
              content = {
                { 'name', zindex = 10 },
                { 'symlink_target', zindex = 10, highlight = 'NeoTreeSymbolicLinkTarget' },
                { 'clipboard', zindex = 10 },
                { 'bufnr', zindex = 10 },
                { 'diagnostics', zindex = 20, align = 'right' },
                { 'git_status', zindex = 20, align = 'left' },
              },
            },
          },
          message = {
            { 'indent', with_markers = false },
            { 'name', highlight = 'NeoTreeMessage' },
          },
          terminal = {
            { 'indent' },
            { 'icon' },
            { 'name' },
            { 'bufnr' },
          },
        },

        nesting_rules = {},

        -- A list of functions, each representing a global custom command
        -- that will be available in all sources (if not overridden in `opts[source_name].commands`)
        -- see `:h neo-tree-global-custom-commands`
        commands = {},

        window = {
          -- see https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/popup for
          -- possible options. These can also be functions that return these options.
          position = 'left', -- left, right, top, bottom, float, current
          width = 40, -- applies to left and right positions
          height = 15, -- applies to top and bottom positions
          auto_expand_width = false, -- expand the window when file exceeds the window width. does not work with position = "float"
          popup = {
            -- settings that apply to float position only
            size = {
              height = '90%',
              width = '30%',
            },
            position = '100%', -- 50% means center it
            -- you can also specify border here, if you want a different setting from
            -- the global popup_border_style.
          },
          same_level = false, -- Create and paste/move files/directories on the same level as the directory under cursor (as opposed to within the directory under cursor).
          insert_as = 'child', -- Affects how nodes get inserted into the tree during creation/pasting/moving of files if the node under the cursor is a directory:
          -- "child":   Insert nodes as children of the directory under cursor.
          -- "sibling": Insert nodes  as siblings of the directory under cursor.
          -- Mappings for tree window. See `:h neo-tree-mappings` for a list of built-in commands.
          -- You can also create your own commands by providing a function instead of a string.
          mapping_options = {
            noremap = true,
            nowait = true,
          },
          mappings = {
            ['<space>'] = false,
            ['<2-LeftMouse>'] = 'open',
            ['<CR>'] = 'open',
            ['<ESC>'] = 'revert_preview',
            ['P'] = { 'toggle_preview', config = { use_float = true } },
            ['l'] = 'focus_preview',
            ['os'] = 'open_split',
            ['ov'] = 'open_vsplit',
            ['s'] = '',
            ['S'] = 'noop',
            ['t'] = 'open_tabnew',
            ['A'] = 'expand_all_nodes',
            ['C'] = 'close_all_nodes',
            ['a'] = {
              'add',
              config = {
                show_path = 'none', -- "none", "relative", "absolute"
              },
            },
            ['D'] = 'delete', -- delete the file or the directory on cursor
            ['r'] = 'rename',
            ['y'] = 'copy_to_clipboard',
            ['x'] = 'cut_to_clipboard',
            ['p'] = 'paste_from_clipboard',
            ['c'] = 'copy', -- takes text input for destination, also accepts the optional config.show_path option like "add":
            ['m'] = 'move', -- takes text input for destination, also accepts the optional config.show_path option like "add".
            ['q'] = 'close_window',
            ['R'] = 'refresh',
            ['?'] = 'show_help',
            ['<'] = 'prev_source',
            ['>'] = 'next_source',
          },
        },

        filesystem = {
          filtered_items = {
            visible = false, -- when true, they will just be displayed differently than normal items
            force_visible_in_empty_folder = false, -- when true, hidden files will be shown if the root folder is otherwise empty
            show_hidden_count = true, -- when true, the number of hidden items in each folder will be shown as the last entry
            hide_dotfiles = false,
            hide_gitignored = true,
            hide_hidden = false, -- only works on Windows for hidden files/directories
            hide_by_name = {
              'node_modules',
            },
            hide_by_pattern = { -- uses glob style patterns
            },
            always_show = { -- remains visible even if other settings would normally hide it
              '.gitignore',
            },
            never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
              '.git',
              '.DS_Store',
              'thumbs.db',
            },
            never_show_by_pattern = { -- uses glob style patterns
            },
          },
          follow_current_file = false, -- This will find and focus the file in the active buffer every
          -- time the current file is changed while the tree is open.
          group_empty_dirs = false, -- when true, empty folders will be grouped together
          search_limit = 50, -- max number of search results when using filters
          hijack_netrw_behavior = 'open_default', -- netrw disabled, opening a directory opens neo-tree
          -- in whatever position is specified in window.position
          -- "open_current",  -- netrw disabled, opening a directory opens within the
          -- window like netrw would, regardless of window.position
          -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
          use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
          -- instead of relying on nvim autocmd events.

          window = {
            mappings = {
              ['<bs>'] = 'navigate_up',
              ['.'] = 'set_root',
              ['h'] = 'toggle_hidden',
              ['H'] = 'noop',
              ['L'] = '',
              ['/'] = 'fuzzy_finder',
              ['d'] = 'fuzzy_finder_directory',
              ['#'] = 'fuzzy_sorter', -- fuzzy sorting using the fzy algorithm
              ['f'] = 'filter_on_submit',
              ['<C-c>'] = 'clear_filter',
              ['[g'] = 'prev_git_modified',
              [']g'] = 'next_git_modified',
            },
            fuzzy_finder_mappings = {
              -- define keymaps for filter popup window in fuzzy_finder_mode
              ['<down>'] = 'move_cursor_down',
              ['<C-n>'] = 'move_cursor_down',
              ['<up>'] = 'move_cursor_up',
              ['<C-p>'] = 'move_cursor_up',
            },
          },
          async_directory_scan = 'auto', -- "auto"   means refreshes are async, but it's synchronous when called from the Neotree commands.
          -- "always" means directory scans are always async.
          -- "never"  means directory scans are never async.
          scan_mode = 'shallow', -- "shallow": Don't scan into directories to detect possible empty directory a priori
          -- "deep": Scan into directories to detect empty or grouped empty directories a priori.
          bind_to_cwd = true, -- true creates a 2-way binding between vim's cwd and neo-tree's root
          cwd_target = {
            sidebar = 'tab', -- sidebar is when position = left or right
            current = 'window', -- current is when position = current
          },
          commands = {}, -- Add a custom command or override a global one using the same function name
        },

        buffers = {
          follow_current_file = true, -- This will find and focus the file in the active buffer every
          -- time the current file is changed while the tree is open.
          group_empty_dirs = true, -- when true, empty folders will be grouped together
          show_unloaded = true,
          window = {
            mappings = {
              ['<C-c>'] = 'buffer_delete',
              ['<bs>'] = 'navigate_up',
              ['.'] = 'set_root',
            },
          },
        },

        git_status = {
          window = {
            position = 'float',
            mappings = {
              ['gA'] = 'git_add_all',
              ['gu'] = 'git_unstage_file',
              ['ga'] = 'git_add_file',
              ['gr'] = 'git_revert_file',
              ['gc'] = 'git_commit',
              ['gp'] = 'git_push',
            },
          },
        },

        ument_symbols = {
          client_filters = 'first',
          renderers = {
            root = {
              { 'indent' },
              { 'icon', default = 'C' },
              { 'name', zindex = 10 },
            },
            symbol = {
              { 'indent', with_expanders = true },
              { 'kind_icon', default = '?' },
              {
                'container',
                content = {
                  { 'name', zindex = 10 },
                  { 'kind_name', zindex = 20, align = 'right' },
                },
              },
            },
          },
        },
      }
    end,
  },
}

