local function call_telescope(builtin_module, opts)
	return function()
		require("telescope.builtin")[builtin_module](require("telescope.themes").get_ivy(opts))
	end
end

return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = "Telescope",
		opts = {
			extensions = {
				file_browser = {
					theme = "ivy",
					hijack_netrw = true,
					hidden = { file_browser = true, folder_browser = true },
				},
				emoji = {
					action = function(emoji)
						vim.fn.setreg("+", emoji.value)
					end,
				},
			},
		},
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)
			telescope.load_extension("file_browser")
			telescope.load_extension("emoji")
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
			{ "<leader>e", "<cmd>Telescope file_browser<cr>", desc = "Explorer" },
			{ "<leader>te", "<cmd>Telescope emoji theme=ivy<cr>", desc = "Emoji selector" },
		},
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
	{
		"xiyaowong/telescope-emoji.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
	},
}
