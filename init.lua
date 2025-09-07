-- Modern Neovim Configuration
-- A VS Code-like experience with modern Lua configuration

-- Bootstrap lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Basic settings
require("config.options")
require("config.keymaps")

-- Load plugins
require("lazy").setup("plugins", {
  change_detection = {
    notify = false,
  },
})