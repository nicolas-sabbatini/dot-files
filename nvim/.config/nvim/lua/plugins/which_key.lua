return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	dependencies = { "echasnovski/mini.nvim" },
	opts = {
		plugins = { spelling = true },
		spec = {
			{
				mode = { "n" },
				{ "g", group = "goto" },
				{ "gl", group = "lsp" },
				{ "gs", group = "surrounding" },
				{ "s", group = "comment" },
				{ "<leader>b", group = "buffer" },
				{ "<leader>c", group = "code" },
				{ "<leader>cc", group = "conform" },
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
