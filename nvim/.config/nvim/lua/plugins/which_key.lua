return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	dependencies = { "echasnovski/mini.icons" },
	opts = {
		plugins = { spelling = true },
		spec = {
			{
				mode = { "n" },
				{ "g", group = "goto" },
				{ "gl", group = "lsp" },
				{ "gs", group = "surrounding" },
				{ "<leader>s", group = "strudel" },
				{ "<leader>b", group = "buffer" },
				{ "<leader>c", group = "code" },
				{ "<leader>f", group = "file/find" },
				{ "<leader>t", group = "telescope" },
			},
			{
				mode = { "v" },
				{ "gs", group = "surrounding" },
			},
		},
	},
}
