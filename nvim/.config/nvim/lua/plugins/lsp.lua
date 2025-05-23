return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v4.x",
	dependencies = {
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/nvim-cmp" },
		{ "L3MON4D3/LuaSnip" },
		{ "neovim/nvim-lspconfig" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "williamboman/mason.nvim" },
		{ "j-hui/fidget.nvim", tag = "legacy", opts = {} },
		{ "folke/neodev.nvim" },
	},
	config = function()
		local lsp = require("lsp-zero")
		lsp.on_attach(function(_, bufnr)
			lsp.default_keymaps({ buffer = bufnr })
		end)
		lsp.set_server_config({
			capabilities = {
				textDocument = {
					foldingRange = {
						dynamicRegistration = false,
						lineFoldingOnly = true,
					},
				},
			},
		})

		local lspconfig = require("lspconfig")
		lspconfig.util.default_config.capabilities = vim.tbl_deep_extend(
			"force",
			lspconfig.util.default_config.capabilities,
			require("cmp_nvim_lsp").default_capabilities()
		)
		lsp.setup()
		require("luasnip.loaders.from_vscode").lazy_load()
		local cmp = require("cmp")
		local cmp_select = { "behavior", cmp.SelectBehavior.Select }
		cmp.setup({
			sources = {
				{ name = "nvim_lsp" },
				{ name = "buffer", keyword_length = 3 },
				{ name = "luasnip", keyword_length = 2 },
				{ name = "path" },
				{ name = "crates" },
			},
			formatting = {
				fields = { "abbr", "menu", "kind" },
				format = function(entry, item)
					local n = entry.source.name
					if n == "nvim_lsp" then
						item.menu = "[LSP]"
					else
						item.menu = string.format("[%s]", n)
					end
					return item
				end,
			},
			mapping = {
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<C-e>"] = cmp.mapping.abort(),
				["<C-j>"] = cmp.mapping.scroll_docs(4),
				["<C-k>"] = cmp.mapping.scroll_docs(-4),
				["<Up>"] = cmp.mapping.select_prev_item(cmp_select),
				["<Down>"] = cmp.mapping.select_next_item(cmp_select),
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
		})
	end,
}
