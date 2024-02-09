return {
	"catppuccin/nvim",
	lazy = true,
	name = "catppuccin",
	opts = {
		flavour = "latte",
		integrations = {
			cmp = true,
			gitsigns = true,
			lsp_trouble = true,
			mason = true,
			native_lsp = {
				enabled = true,
				underlines = {
					errors = { "undercurl" },
					hints = { "undercurl" },
					warnings = { "undercurl" },
					information = { "undercurl" },
				},
			},
			telescope = true,
			treesitter = true,
			which_key = true,
		},
	},
}
