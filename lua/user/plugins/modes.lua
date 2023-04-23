-- local status_ok, modes = pcall(require, 'modes')
-- if not status_ok then
--   return
-- end

return {
  {
    'mvllow/modes.nvim',
    config = function()
      require('modes').setup {
        colors = {
          -- copy = '#c7c7c7',
          -- delete = '#c7c7c7',
          insert = '#78A9FF',
          -- insert = '#c7c7c7',
          visual = '#BE95FF',
          -- visual = '#c7c7c7',
        },

        -- Set opacity for cursorline and number background
        line_opacity = 0.2,

        -- Enable cursor highlights
        set_cursor = false,

        -- Enable cursorline initially, and disable cursorline for inactive windows
        -- or ignored filetypes
        set_cursorline = true,

        -- Enable line number highlights to match cursorline
        set_number = true,

        -- Disable modes highlights in specified filetypes
        -- Please PR commonly ignored filetypes
        ignore_filetypes = { 'NvimTree', 'TelescopePrompt' },
      }
    end,
  },
}
