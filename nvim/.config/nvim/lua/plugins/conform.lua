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
				javascript = { "deno_fmt" },
				typescript = { "deno_fmt" },
				html = { "deno_fmt" },
				md = { "deno_fmt" },
				markdown = { "deno_fmt" },
				c = { "clang-format" },
				["*"] = { "trim_whitespace" },
			},
		},
	},
}
