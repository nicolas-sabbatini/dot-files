-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup lvimr_user_plugins_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | LvimReload
  augroup end
]]

lvim.plugins = {
  { "catppuccin/nvim" },
  { "p00f/nvim-ts-rainbow" },
  { 'nvim-telescope/telescope-media-files.nvim' },
}
