return {
  {
    'mvllow/modes.nvim',
    event = { 'BufRead', 'BufNewFile' },
    config = function()
      require('modes').setup {
        colors = {
          -- copy = '#c7c7c7',
          -- delete = '#c7c7c7',
          insert = '#78A9FF',
          visual = '#BE95FF',
        },

        -- Set opacity for cursorline and number background
        line_opacity = 0.4,

        -- Enable cursor highlights
        set_cursor = false,

        -- Enable cursorline initially, and disable cursorline for inactive windows
        -- or ignored filetypes
        set_cursorline = false,

        -- Enable line number highlights to match cursorline
        set_number = false,

        -- Disable modes highlights in specified filetypes
        -- Please PR commonly ignored filetypes
        ignore = { 'NvimTree', 'TelescopePrompt' },
      }
    end,
  },
}
