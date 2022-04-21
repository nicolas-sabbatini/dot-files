-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup lvimr_user_plugins_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | LvimReload
  augroup end
]]

lvim.plugins = {
  { "catppuccin/nvim" },
  {
    "tzachar/cmp-tabnine",
    config = function()
      local tabnine = require "cmp_tabnine.config"
      tabnine:setup {
        max_lines = 1000,
        max_num_results = 3,
        sort = true,
      }
    end,
    run = "./install.sh",
    requires = "hrsh7th/nvim-cmp",
  },
}
