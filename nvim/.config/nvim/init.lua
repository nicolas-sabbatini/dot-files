-- Bootstrap lazy vim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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
local runtime = vim.api.nvim_list_runtime_paths()

-- Set map leader to <Space>
vim.g.mapleader = " "
require("./options")
require("./keymaps")
require("./autocmds")

-- Load plugins in the plugins folder
local plugins_names = vim.fs.dir(runtime[2] .. "/lua/plugins")
local plugins = {}
for name, _ in plugins_names do
	local status_ok, plugin = pcall(require, "plugins." .. name:gsub("%.lua", ""))
	if not status_ok then
		vim.notify("Error loading " .. name)
	else
		table.insert(plugins, plugin)
	end
end

-- Set up lazy and plugins
require("lazy").setup(plugins)

vim.cmd.colorscheme("rose-pine")
