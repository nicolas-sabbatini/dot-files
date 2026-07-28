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
require("options")
require("keymaps")
require("autocmds")

-- Set up lazy and plugins
require("lazy").setup({ { import = "plugins" } })

-- LSP config runs after lazy.setup so that plugin dependencies
-- (e.g. cmp_nvim_lsp for capabilities) are already in the runtime path.
require("lsp")
