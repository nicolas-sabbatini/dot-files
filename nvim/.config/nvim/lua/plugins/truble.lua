return {
	"folke/trouble.nvim",
	opts = {},
	cmd = "Trouble",
	keys = {
		{
			"<leader>tt",
			"<cmd>Trouble toggle<cr>",
			desc = "Toggle trouble",
		},
		{
			"<leader>cD",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "File diagnostics",
		},
		{
			"<leader>cw",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Workspace diagnostics",
		},
		{
			"<leader>xQ",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Quickfix List",
		},
	},
}
