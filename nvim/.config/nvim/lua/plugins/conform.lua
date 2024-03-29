return {
	{
		"stevearc/conform.nvim",
		opts = {
			format_on_save = {
				-- I recommend these options. See :help conform.format for details.
				lsp_fallback = true,
				timeout_ms = 500,
			},
			format_after_save = {
				lsp_fallback = true,
			},
			formatters_by_ft = {
				go = { "goimports", "gofmt" },
				lua = { "stylua" },
				sh = { "shfmt" },
				javascript = { { "prettierd", "prettier" } },
				typescript = { { "prettierd", "prettier" } },
				md = { "prettierd" },
				html = { "prettierd" },
				markdown = { "prettierd" },
				["*"] = { "trim_whitespace" },
			},
			formatters = {
				prettierd = {
					condition = function()
						return vim.g.conform
					end,
				},
				prettier = {
					condition = function()
						return vim.g.conform
					end,
				},
			},
		},
	},
}
