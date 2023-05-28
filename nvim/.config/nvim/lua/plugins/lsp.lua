return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      lua_ls = {
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = false,
            },
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      },
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = {
              command = "clippy",
            },
            check = {
              command = "clippy",
            },
          },
        },
      },
      gdscript = {
        -- Comet fot v4
        -- command = vim.lsp.rpc.connect("127.0.0.1", 6008),
      },
    },
  },
}
