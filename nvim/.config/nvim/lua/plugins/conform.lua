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
				javascript = { "deno_fmt" },
				typescript = { "deno_fmt" },
				json = { "deno_fmt" },
				html = { "deno_fmt" },
				css = { "deno_fmt" },
				md = { "deno_fmt" },
				markdown = { "deno_fmt" },
				c = { "clang-format" },
				zig = { "zig_format" },
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
