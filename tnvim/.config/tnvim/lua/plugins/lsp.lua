return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  dependencies = {
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/nvim-cmp' },
    { 'L3MON4D3/LuaSnip' },
    { 'neovim/nvim-lspconfig' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'williamboman/mason.nvim' },
    { 'zbirenbaum/copilot-cmp' },
  },
  config = function()
    local lsp = require('lsp-zero').preset({})
    lsp.on_attach(function(client, bufnr)
      lsp.default_keymaps({ buffer = bufnr })
    end)
    lsp.set_server_config({
      capabilities = {
        textDocument = {
          foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true
          }
        }
      }
    })
    lsp.setup()
    local cmp = require('cmp')
    local cmp_select = { 'behavior', cmp.SelectBehavior.Select }

    require('luasnip.loaders.from_vscode').lazy_load()
    cmp.setup({
      sources = {
        { name = 'nvim_lsp' },
        { name = 'copilot' },
        { name = 'buffer',  keyword_length = 3 },
        { name = 'luasnip', keyword_length = 2 },
        { name = 'path' },
      },
      mapping = {
        ['<CR>'] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        }),
        ['<C-y>'] = cmp.mapping.complete(),
      }
    })
  end,
}
