return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v2.x",
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
		local lsp = require("lsp-zero").preset({})
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
		lspconfig.rust_analyzer.setup({
			settings = {
				["rust-analyzer"] = {
					cargo = {
						allFeatures = true,
						loadOutDirsFromCheck = true,
						runBuildScripts = true,
					},
					check = {
						command = "clippy",
						extraArgs = { "--no-deps", "--", "-W", "clippy::pedantic" },
					},
				},
			},
		})
		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					workspace = {
						checkThirdParty = true,
						telemetry = { enable = false },
						library = {
							"${3rd}/love2d/library",
							vim.fn.expand("$VIMRUNTIME/lua"),
							vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
						},
					},
				},
				globals = { "vim" },
			},
		})
		lspconfig.eslint.setup({
			on_attach = function(client, bufnr)
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					command = "EslintFixAll",
				})
			end,
		})

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
			mapping = {
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<C-e>"] = cmp.mapping.abort(),
				["<C-j>"] = cmp.mapping.scroll_docs(4),
				["<C-k>"] = cmp.mapping.scroll_docs(-4),
				["<Up>"] = cmp.mapping.select_prev_item(cmp_select),
				["<Down>"] = cmp.mapping.select_next_item(cmp_select),
			},
		})
	end,
}
