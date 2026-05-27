-- Bootstrap lazy vim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
-- Add lazypath to vim path
vim.opt.rtp:prepend(lazypath)

-- Set map leader to <Space>
vim.g.mapleader = " "
require("./options")
require("./keymaps")
require("./autocmds")
require("./lsp")

-- Set up lazy and plugins
require("lazy").setup({ { import = "plugins" } })

vim.cmd.colorscheme("gruvbox-material")
