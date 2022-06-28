lvim.plugins = {
  { "catppuccin/nvim" },
  { "p00f/nvim-ts-rainbow" },
  { "nvim-telescope/telescope-media-files.nvim" },
  { -- crates.io completion
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    config = function()
      require("crates").setup()
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
}
