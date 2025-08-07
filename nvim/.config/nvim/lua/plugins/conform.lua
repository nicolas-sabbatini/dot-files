return {
	{
		"stevearc/conform.nvim",
		opts = {
			format_on_save = {
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
				javascript = { "prettier" },
				typescript = { "prettier" },
				html = { "prettier" },
				md = { "prettier" },
				markdown = { "prettier" },
				gdscript = { "gdformat" },
				c = { "clang-format" },
				sql = { "sqlfmt" },
				["*"] = { "trim_whitespace" },
			},
		},
	},
}
