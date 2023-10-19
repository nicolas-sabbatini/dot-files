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
		{ "zbirenbaum/copilot-cmp" },
		{ "j-hui/fidget.nvim", tag = "legacy", opts = {} },
	},
	config = function()
		local lsp = require("lsp-zero").preset({})
		lsp.on_attach(function(client, bufnr)
			lsp.default_keymaps({ buffer = bufnr })
			lsp.buffer_autoformat()
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
		lsp.format_on_save({
			format_opts = {
				async = false,
				timeout_ms = 10000,
			},
			servers = {
				["null-ls"] = { "javascript", "typescript", "lua", "sh", "bash", "json" },
			},
		})

		require("lspconfig")["rust_analyzer"].setup({
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

		lsp.setup()
		require("luasnip.loaders.from_vscode").lazy_load()

		local cmp = require("cmp")
		local cmp_select = { "behavior", cmp.SelectBehavior.Select }
		cmp.setup({
			sources = {
				{ name = "nvim_lsp" },
				{ name = "copilot" },
				{ name = "buffer", keyword_length = 3 },
				{ name = "luasnip", keyword_length = 2 },
				{ name = "path" },
				{ name = "crates" },
			},
			mapping = {
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = false,
				}),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<C-e>"] = cmp.mapping.abort(),
				["<C-j>"] = cmp.mapping.scroll_docs(-4),
				["<C-k>"] = cmp.mapping.scroll_docs(4),
				["<Up>"] = cmp.mapping.select_prev_item(cmp_select),
				["<Down>"] = cmp.mapping.select_next_item(cmp_select),
			},
		})
	end,
}
