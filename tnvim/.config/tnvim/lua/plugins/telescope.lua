local function call_telescope(builtin_module, opts)
	return function()
		require("telescope.builtin")[builtin_module](require("telescope.themes").get_ivy(opts))
	end
end

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.2",
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = "Telescope",
	keys = {
		{ "<leader>/", call_telescope("live_grep"), desc = "Grep (root dir)" },
		{ "<leader>ff", call_telescope("find_files"), desc = "Find Files" },
		{ "<leader>fF", call_telescope("find_files", { hidden = true, no_ignore = true }), desc = "Find Files ALL" },
		{ "<leader>fg", call_telescope("git_files"), desc = "Find Files Git" },
		{ "<leader>fb", call_telescope("buffers"), desc = "Find Files Git" },
	},
}
