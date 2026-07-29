local function pick_js_formatter(bufnr)
	local matches = vim.fs.find({ "package.json", "package-lock.json" }, {
		upward = true,
		path = vim.api.nvim_buf_get_name(bufnr),
	})
	if #matches > 0 then
		return { "prettier" }
	end
	return { "deno_fmt" }
end

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
				javascript = pick_js_formatter,
				typescript = pick_js_formatter,
				json = pick_js_formatter,
				html = pick_js_formatter,
				css = pick_js_formatter,
				markdown = pick_js_formatter,
				vento = { "deno_fmt" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				zig = { "zig_format" },
				yaml = { "yamlfmt" },
				gdscript = { "gdscript-formatter" },
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
