local telescope_ok, telescope = pcall(require, "telescope")
if not telescope_ok then
  vim.notify("Error loading Telescope! misc.lua 3")
  return
end

telescope.setup()
