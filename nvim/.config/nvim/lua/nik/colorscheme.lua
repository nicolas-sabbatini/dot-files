local colorscheme = "catppuccin"
vim.g.catppuccin_flavour = "macchiato"

local ok, cat = pcall(require, "catppuccin")
if not ok then
  vim.notify("Error loading Catppuccin! colorscheme.lua 12")
  return
end

cat.setup({
  transparent_background = false,
  term_colors = false,
  compile = {
    enabled = false,
    path = vim.fn.stdpath("cache") .. "/catppuccin",
  },
  dim_inactive = {
    enabled = false,
  },
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  integrations = {
    -- Enabled
    treesitter = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
    },
    cmp = true,
    gitsigns = true,
    telescope = true,
    nvimtree = {
      enabled = true,
      show_root = true,
      transparent_panel = false,
    },
    markdown = true,
    bufferline = true,
    ts_rainbow = true,
    notify = true,
    symbols_outline = true,
    vimwiki = true,
    -- Disabled
    beacon = false,
    coc_nvim = false,
    lsp_trouble = false,
    lsp_saga = false,
    gitgutter = false,
    dap = {
      enabled = false,
    },
    neotree = {
      enabled = false,
    },
    which_key = false,
    indent_blankline = {
      enabled = false,
    },
    dashboard = false,
    neogit = false,
    vim_sneak = false,
    fern = false,
    barbar = false,
    lightspeed = false,
    leap = false,
    hop = false,
    telekasten = false,
    mini = false,
    aerial = false,
    navic = false,
    overseer = false,
  },
  color_overrides = {},
  highlight_overrides = {},
})

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
end
