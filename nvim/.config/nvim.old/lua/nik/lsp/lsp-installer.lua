local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  vim.notify("Error loading lsp-installer! lsp.lsp-installer.lua 3")
  return
end

-- https://github.com/williamboman/nvim-lsp-installer#setup
lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require("nik.lsp.handlers").on_attach,
    capabilities = require("nik.lsp.handlers").capabilities,
  }
  -- Customize server opts
  if server.name == "sumneko_lua" then
    local sumneko_opts = require("nik.lsp.settings.sumneko_lua")
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  elseif server.name == "rust_analyzer" then
    local rust_analyzer_opts = require("nik.lsp.settings.rust_analyzer")
    opts = vim.tbl_deep_extend("force", rust_analyzer_opts, opts)
  end

  server:setup(opts)
end)
