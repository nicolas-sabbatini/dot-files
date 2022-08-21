local ufo_ok, ufo = pcall(require, "ufo")
if not ufo_ok then
  vim.notify("Error loading UFO! ufo.lua 4")
  return
end

ufo.setup()
vim.keymap.set('n', 'zR', ufo.openAllFolds)
vim.keymap.set('n', 'zM', ufo.closeAllFolds)
