local function call_telescope(builtin_module, opts)
	return function()
		require("telescope.builtin")[builtin_module](require("telescope.themes").get_ivy(opts))
	end
end

return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = "Telescope",
		opts = {
			pickers = {
				live_grep = {
					additional_args = { "--hidden" },
				},
			},
			extensions = {
				file_browser = {
					theme = "ivy",
					hijack_netrw = true,
					hidden = { file_browser = true, folder_browser = true },
					no_ignore = true,
				},
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		},
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)
			telescope.load_extension("file_browser")
		end,
		keys = {
			{
				"<leader>/",
				call_telescope("live_grep", { hidden = true, no_ignore = true }),
				desc = "Grep (root dir)",
			},
			{ "<leader>ff", call_telescope("find_files"), desc = "Find Files" },
			{
				"<leader>fF",
				call_telescope("find_files", { hidden = true, no_ignore = true }),
				desc = "Find Files ALL",
			},
			{
				"<leader>fg",
				call_telescope("git_files"),
				desc = "Find Files Git",
			},
			{ "<leader>be", call_telescope("buffers"), desc = "Find Buffer" },
			{
				"<leader>e",
				"<cmd>Telescope file_browser path=%:p:h select_buffer=true initial_mode=normal<cr>",
				desc = "Explorer current file",
			},
			{
				"<leader>E",
				"<cmd>Telescope file_browser initial_mode=normal initial_mode=normal<cr>",
				desc = "Explorer root",
			},
		},
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		dependencies = { "nvim-telescope/telescope.nvim" },
	},
}
