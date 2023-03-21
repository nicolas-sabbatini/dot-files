return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      -- Bash
      "bash-language-server",
      "shellcheck",
      "shfmt",
      -- TS
      "eslint-lsp",
      "prettierd",
      "typescript-language-server",
      "prisma-language-server",
      -- Python
      "flake8",
      -- Rust
      "rust-analyzer",
      "rustfmt",
      -- JSON
      "json-lsp",
      -- Lua
      "lua-language-server",
      "stylua",
      -- Markdown
      "marksman",
    },
  },
}
