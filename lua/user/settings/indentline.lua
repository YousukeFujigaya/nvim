-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help ibl.txt`

local status_ok, ibl = pcall(require, 'ibl')
if not status_ok then
  return
end

ibl.setup({
  indent = {
    char = '┊',
  },
  scope = {
    enabled = true,
  },
  exclude = {
    buftypes = { 'terminal', 'nofile' },
    filetypes = {
      'help',
      'startify',
      'dashboard',
      'neogitstatus',
      'NvimTree',
      'Trouble',
    },
  },
})

-- HACK: work-around for https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
vim.wo.colorcolumn = '99999'