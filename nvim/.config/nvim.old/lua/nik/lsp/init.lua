local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  vim.notify("Error loading lspconfig! lsp.init.lua 3")
  return
end

require("nik.lsp.lsp-installer")
require("nik.lsp.handlers").setup()
