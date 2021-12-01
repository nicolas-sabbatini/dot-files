-- General settings
lvim.log.level = "warn" -- ?? Default setting
lvim.debug = false -- ??

lvim.colorscheme = "tomorrow"

lvim.format_on_save = true

-- Vim options
vim.opt.conceallevel = 0 -- `` is visible in markdown files
vim.opt.mouse = "a" -- allow the mouse
vim.opt.showtabline = 2 -- always show tabs
vim.opt.updatetime = 300 -- faster completion
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.wrap = false -- display lines as one long line
vim.opt.spell = false
vim.opt.spelllang = "es,en"
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10

lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- Plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- Additional plugins
lvim.plugins = {
  {"lunarvim/colorschemes"},
}

-- Treesitter Config
-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  "rust",
  "java",
  "yaml",
  "toml",
}

lvim.builtin.treesitter.highlight.enabled = true
