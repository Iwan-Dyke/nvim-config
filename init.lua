-- Bootstrap lazy.nvim
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,})
end
vim.opt.rtp:prepend(lazypath)

-- Load Config Modules
require("config.options")
require("config.keymaps")
require("config.lsp")

-- Setup Plugins
require("lazy").setup("plugins")
