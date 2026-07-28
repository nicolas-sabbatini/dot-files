return {
	"gruvw/strudel.nvim",
	build = "npm ci",
	opts = {
		ui = {
			maximise_menu_panel = false,
		},
	},
	keys = {
		{
			"<leader>sl",
			function()
				require("strudel").launch()
			end,
			desc = "Launch Strudel",
		},
		{
			"<leader>sq",
			function()
				require("strudel").quit()
			end,
			desc = "Quit Strudel",
		},
		{
			"<leader>st",
			function()
				require("strudel").toggle()
			end,
			desc = "Strudel Toggle Play/Stop",
		},
		{
			"<leader>su",
			function()
				require("strudel").update()
			end,
			desc = "Strudel Update",
		},
		{
			"<leader>ss",
			function()
				require("strudel").stop()
			end,
			desc = "Strudel Stop Playback",
		},
		{
			"<leader>sb",
			function()
				require("strudel").set_buffer()
			end,
			desc = "Strudel set current buffer",
		},
		{
			"<leader>sx",
			function()
				require("strudel").execute()
			end,
			desc = "Strudel set current buffer and update",
		},
	},
}
