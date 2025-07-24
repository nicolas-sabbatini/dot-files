return {
	"otavioschwanck/arrow.nvim",
	dependencies = {
		{ "echasnovski/mini.icons" },
	},
	opts = {
		show_icons = true,
		always_show_path = true,
		leader_key = "gb",
		separate_save_and_remove = true,
		buffer_leader_key = "ga",
		global_bookmarks = true,
		save_path = function()
			return vim.fn.getcwd() .. "/.vim/arrow"
		end,
		mappings = {
			edit = "e",
			delete_mode = "d",
			clear_all_items = "C",
			toggle = "s", -- used as save if separate_save_and_remove is true
			open_vertical = "v",
			open_horizontal = "h",
			quit = "q",
			remove = "x", -- only used if separate_save_and_remove is true
			next_item = "]",
			prev_item = "[",
		},
	},
}
