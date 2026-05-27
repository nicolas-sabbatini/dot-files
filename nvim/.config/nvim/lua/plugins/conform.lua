return {
	{
		"stevearc/conform.nvim",
		opts = {
			format_on_save = {
				lsp_format = "fallback",
				timeout_ms = 5000,
			},
			formatters_by_ft = {
				go = { "goimports", "gofmt" },
				lua = { "stylua" },
				sh = { "shfmt" },
				javascript = { "deno_fmt", "prettier" },
				typescript = { "deno_fmt", "prettier" },
				json = { "deno_fmt" },
				html = { "deno_fmt" },
				css = { "deno_fmt" },
				vento = { "deno_fmt" },
				markdown = { "deno_fmt" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				zig = { "zig_format" },
				yaml = { "yamlfmt" },
				["*"] = { "trim_whitespace" },
			},
			formatters = {
				zig_format = {
					command = "zig",
					args = { "fmt", "$FILENAME" },
					stdin = false,
					tmpfile_format = ".conform.$RANDOM.$FILENAME",
				},
			},
		},
	},
}
