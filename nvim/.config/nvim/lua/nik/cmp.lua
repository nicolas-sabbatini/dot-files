local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  vim.notify("Error loading CMP! cmp.lua 3")
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  vim.notify("Error loading luasnip! cmp.lua 9")
  return
end

require("luasnip/loaders/from_vscode").lazy_load()

-- Improve super TAB usage
local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

cmp.setup {
  -- Specify snippet engine
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  -- Key mapping
  mapping = {
    -- Move using CTRL + [k|j] inside of the map
    -- ["<C-k>"] = cmp.mapping.select_prev_item(),
    -- ["<C-j>"] = cmp.mapping.select_next_item(),
    -- Move inside of the tooltip CTRL + [b|f]
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    -- Open all snippet CTRL + SPACE
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-y>"] = cmp.config.disable,
    -- Close completion
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm { select = true },
    -- Set super tab
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    -- Super SHIFT TAB
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
  -- Set cmp menu format
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format('%s %s', vim_item.kind, kind_icons[vim_item.kind])
      vim_item.menu = ({
        luasnip = "[Snippet]",
        buffer = "[Buffer]",
        path = "[Path]",
        crates = "[Creates]",
        emoji = "[😬]",
        npm = "[npm]",
        nvim_lua = "[LSP]",
        nvim_lsp = "[LSP]",
        cmp_tabnine = "[TAB9]",
      })[entry.source.name]
      return vim_item
    end,
  },
  -- Sources for the completion
  sources = {
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "crates" },
    { name = "npm", keyword_length = 4 },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
    { name = "emoji" },
    { name = "cmp_tabnine" },
  },
  -- Confirm options
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  -- Show documentation
  windows = {
    documentation = true,
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
  },
  -- Disable experimenetal
  experimental = {
    ghost_text = false,
    native_menu = false,
  },
}

-- Complition on search
cmp.setup.cmdline("/", {
  sources = {
    { name = "buffer" }
  }
}
)

-- Complition on comand mode
cmp.setup.cmdline(":", {
  sources = {
    { name = "path" },
    { name = "cmdline" },
  }
}
)
