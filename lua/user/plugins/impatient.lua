return {
  'lewis6991/impatient.nvim', -- Speed up loading Lua modules in Neovim to improve startup time.
  config = function()
    require('impatient').enable_profile()
  end,
}
