-------------------------
-- telescope Extension --
-------------------------
-- You don't need to set any of these options.
-- IMPORTANT!: this is only a showcase of how you can set default options!
require('telescope').setup {
  extensions = {
    file_browser = {
      -- theme = 'ivy',
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ['i'] = {
          -- your custom insert mode mappings
        },
        ['n'] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
}
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
pcall(require('telescope').load_extension, 'file_browser')

vim.keymap.set('n', '<leader>fb', require('telescope').extensions.file_browser.file_browser, { desc = '[F]ile [B]rowser' })
