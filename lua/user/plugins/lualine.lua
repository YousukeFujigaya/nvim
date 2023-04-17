-- Set lualine as statusline
-- See `:help lualine.txt`

return {
  'nvim-lualine/lualine.nvim', -- Set lualine as statusline
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local lualine = require 'lualine'

    local colors = {
      bg = '#282828',
      fg = '#dfdfe0',
      green = '#25be6a', -- or #42BE65
      yellow = '#08BDBA',
      blue = '#78A9FF',
      cyan = '#33B1FF',
      -- orange = '#3DDBD9',
      orange = '#FF8800',
      violet = '#a9a1e1',
      magenta = '#BE95FF',
      pink = '#FF7EB6',
      red = '#EE5396',
    }

    local conditions = {
      buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand '%:t') ~= 1
      end,
      hide_in_width = function()
        return vim.fn.winwidth(0) > 80
      end,
      check_git_workspace = function()
        local filepath = vim.fn.expand '%:p:h'
        local gitdir = vim.fn.finddir('.git', filepath .. ';')
        return gitdir and #gitdir > 0 and #gitdir < #filepath
      end,
    }

    -- Config
    local config = {
      options = {
        icons_enabled = true,
        -- Disable sections and component separators
        component_separators = '',
        section_separators = '',
        disabled_filetypes = { 'alpha', 'dashboard', 'NvimTree', 'Outline' },
        always_divide_middle = true,
        theme = {
          -- We are going to use lualine_c an lualine_x as left and
          -- right section. Both are highlighted by c theme .  So we
          -- are just setting default looks o statusline
          normal = { c = { fg = colors.fg, bg = colors.bg } },
          inactive = { c = { fg = colors.fg, bg = colors.bg } },
        },
      },
      sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- These will be filled later
        lualine_c = {},
        lualine_x = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
      },
    }

    -- Inserts a component in lualine_c at left section
    local function ins_left(component)
      table.insert(config.sections.lualine_c, component)
    end

    -- Inserts a component in lualine_x ot right section
    local function ins_right(component)
      table.insert(config.sections.lualine_x, component)
    end

    ins_left {
      -- mode component
      function()
        local mode_state = vim.api.nvim_get_mode().mode
        if mode_state == ('i' or 'ic' or 'ix') then
          return '- ' .. 'Insert' .. ' -'
        elseif mode_state == ('v' or 'vs' or 'V' or 'Vs') then
          return '- ' .. 'Visual' .. ' -'
        elseif mode_state == 't' then
          return '- ' .. 'Terminal' .. ' -'
        else
          return '- ' .. 'Normal' .. ' -'
        end
      end,

      color = function()
        -- auto change color according to neovims mode
        local mode_color = {
          n = colors.fg,
          i = colors.blue,
          v = colors.magenta,
          [''] = colors.magenta,
          V = colors.blue,
          c = colors.magenta,
          no = colors.red,
          s = colors.orange,
          S = colors.orange,
          [''] = colors.orange,
          ic = colors.yellow,
          R = colors.violet,
          Rv = colors.violet,
          cv = colors.red,
          ce = colors.red,
          r = colors.cyan,
          rm = colors.cyan,
          ['r?'] = colors.cyan,
          ['!'] = colors.red,
          t = colors.blue,
        }
        return { fg = mode_color[vim.api.nvim_get_mode().mode] }
      end,
      padding = { left = 2, right = 2 },
    }

    -- ins_left {
    --   'filetype',
    --   icon_only = true,
    --   color = { fg = colors.green },
    -- }
    -- ins_left {
    --   'filename',
    --   cond = conditions.buffer_not_empty,
    --   symbols = {
    --     modified = '', -- Text to show when the file is modified.
    --     readonly = '', -- Text to show when the file is non-modifiable or readonly.
    --     unnamed = '[No Name]', -- Text to show for unnamed buffers.
    --     newfile = '', -- Text to show for newly created file before first write
    --   },
    --   color = { fg = colors.fg },
    -- }

    ins_left {
      'branch',
      icon = '',
      color = { fg = colors.green },
    }
    -- ins_left {
    --   'progress',
    --   color = { fg = colors.fg },
    -- }

    ins_left {
      'searchcount',
      icon = '',
    }
    ins_left {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      sections = { 'error', 'warn' },
      symbols = {
        error = ' ',
        warn = ' ',
        -- info = ' ',
      },
      diagnostics_color = {
        color_error = { fg = colors.red },
        color_warn = { fg = colors.yellow },
        -- color_info = { fg = colors.cyan },
      },
      update_in_insert = false,
      always_visible = true,
    }

    -- Insert mid section. You can make any number of sections in neovim :)
    -- for lualine it's any number greater then 2
    ins_right {
      'diff',
      symbols = {
        added = ' ',
        modified = ' ',
        removed = ' ',
      },
      diff_color = {
        added = { fg = colors.cyan },
        modified = { fg = colors.green },
        removed = { fg = colors.red },
      },
      cond = conditions.hide_in_width,
    }
    ins_right {
      -- Lsp server name .
      function()
        local msg = 'No Active'
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
          return msg
        end
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 and client.name ~= 'null-ls' then
            return client.name
          end
        end
        return msg
      end,
      icon = ' LSP:',
      color = { fg = colors.fg },
    }
    ins_right {
      function()
        return '%='
      end,
    }
    ins_right {
      -- 'filename',
      cond = conditions.buffer_not_empty,
      symbols = {
        modified = '', -- Text to show when the file is modified.
        readonly = '', -- Text to show when the file is non-modifiable or readonly.
        unnamed = '[No Name]', -- Text to show for unnamed buffers.
        newfile = '', -- Text to show for newly created file before first write
      },
    }
    --   color = { fg = colors.fg },
    -- }
    -- ins_right {
    --   -- filesize component
    --   'filesize',
    --   cond = conditions.buffer_not_empty,
    --   color = { fg = colors.green },
    -- }
    ins_right {
      'filetype',
      -- icon_only = true,
      icons_enabled = true,
      color = { fg = colors.fg },
      icon = nil,
    }
    ins_right {
      'o:encoding', -- option component same as &encoding in viml
      fmt = string.upper,
      cond = conditions.hide_in_width,
      color = { fg = colors.fg },
    }
    -- ins_right {
    --   'location',
    --   color = { fg = colors.fg },
    lualine.setup(config)
  end,
}
