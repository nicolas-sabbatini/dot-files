local home = os.getenv("HOME") .. "/.config/lvim/settings/"

dofile(home .. "vim-config.lua")
dofile(home .. "lvim-config.lua")
dofile(home .. "plugins.lua")
dofile(home .. "auto-cmd.lua")
