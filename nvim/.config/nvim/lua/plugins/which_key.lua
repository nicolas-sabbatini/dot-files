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
				{ "s", group = "comment" },
				{ "<leader>s", group = "comment" },
				{ "<leader>b", group = "buffer" },
				{ "<leader>c", group = "code" },
				{ "<leader>cc", group = "conform" },
				{ "<leader>f", group = "file/find" },
				{ "<leader>t", group = "telescope" },
				{ "<leader>w", group = "wiki" },
			},
		},
		{
			mode = { "v" },
			{ "s", group = "surrounding" },
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
	end,
}
