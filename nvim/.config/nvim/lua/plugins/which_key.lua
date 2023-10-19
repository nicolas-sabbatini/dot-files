return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		plugins = { spelling = true },
		defaults_normal = {
			["g"] = { name = "+goto" },
			["gl"] = { name = "+lsp" },
			["s"] = { name = "+comment" },
			["<leader>b"] = { name = "+buffer" },
			["<leader>c"] = { name = "+code" },
			["<leader>f"] = { name = "+file/find" },
			["<leader>t"] = { name = "+telescope" },
		},
		defaults_visual = {
			["s"] = { name = "+comment" },
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
		wk.register(opts.defaults_normal)
		wk.register(opts.defaults_visual, { mode = "v" })
	end,
}
