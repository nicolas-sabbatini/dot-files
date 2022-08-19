local ok, feline = pcall(require, "feline")
if not ok then
  vim.notify("Error loading feline! feline/init.lua 3")
  return
end

local c_ok, comp = pcall(require, "nik.feline.components")
if not c_ok then
  vim.notify(comp)
  vim.notify("Error loading feline components! feline/init.lua 9")
  return
end


feline.setup({
  components = {
    active = {
      {
        comp.vi,
        comp.branch,
        comp.diff,
        comp.line,
        comp.cursor,
      },
      {
        comp.workspace_status,
      },
      {
        comp.lsp_error,
        comp.lsp_warn,
        comp.lsp_info,
        comp.lsp_hints,
        comp.treesitter,
        comp.lsp_names,
        comp.file,
      },
    },
    inactive = {},
  },
})
