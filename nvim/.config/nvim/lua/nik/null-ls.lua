local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  vim.notify("Error loading null-ls! gitsigns.lua 3")
  return
end

local formatting = null_ls.builtins.formatting
-- local completion = null_ls.builtins.completion
-- local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
  sources = {
    formatting.json_tool,
  },
}
