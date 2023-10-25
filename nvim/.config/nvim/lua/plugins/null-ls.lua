return {
	"jose-elias-alvarez/null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { { "mason.nvim" }, { "jose-elias-alvarez/typescript.nvim" } },
	opts = function()
		local nls = require("null-ls")
		return {
			root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
			sources = {
				nls.builtins.formatting.stylua,
				nls.builtins.formatting.shfmt,
				nls.builtins.diagnostics.eslint,
				nls.builtins.diagnostics.hadolint, -- Docker files
				-- ts
				require("typescript.extensions.null-ls.code-actions"),
			},
		}
	end,
}
