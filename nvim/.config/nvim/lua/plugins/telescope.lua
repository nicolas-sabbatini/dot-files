local function call_telescope(builtin_module, opts)
	return function()
		require("telescope.builtin")[builtin_module](require("telescope.themes").get_ivy(opts or {}))
	end
end

return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "v0.2.1",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = "Telescope",
		opts = {
			defaults = {
				file_ignore_patterns = { "^.git/", "^%.vim/" },
			},
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
			telescope.load_extension("fzf")
		end,
		keys = {
			-- General
			{ "<leader>tr", call_telescope("resume"), desc = "Telescope reume" },
			{ "<leader>cq", call_telescope("quickfix"), desc = "Quickfix List" },
			-- Navegation
			{ "<leader>/", call_telescope("live_grep", { hidden = true }), desc = "Grep (root dir)" },
			{ "<leader>ff", call_telescope("find_files", { hidden = true }), desc = "Find Files" },
			{
				"<leader>fF",
				call_telescope("find_files", { hidden = true, no_ignore = true }),
				desc = "Find Files ALL",
			},
			{ "<leader>fg", call_telescope("git_files"), desc = "Find Files Git" },
			{ "<leader>be", call_telescope("buffers"), desc = "Find Buffer" },
			{
				"<leader>e",
				call_telescope("file_browser", { path = "%:p:h", select_buffer = true, initial_mode = "normal" }),
				desc = "Explorer",
			},
			{ "<leader>E", call_telescope("file_browser", { initial_mode = "normal" }), desc = "Explorer root" },
			-- LSP
			{
				"<leader>cb",
				call_telescope("diagnostics", { bufnr = 0, initial_mode = "normal" }),
				desc = "File diagnostics",
			},
			{
				"<leader>cw",
				call_telescope("diagnostics", { initial_mode = "normal" }),
				desc = "Workspace diagnostics",
			},
			{ "glr", call_telescope("lsp_references"), desc = "Go references" },
			{ "gli", call_telescope("lsp_implementations"), desc = "Go implementations" },
			{ "gld", call_telescope("lsp_definitions"), desc = "Go definition" },
			{ "glD", call_telescope("lsp_type_definitions"), desc = "Go type definition" },
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
