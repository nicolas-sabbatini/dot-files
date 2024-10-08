return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
	opts = {
		ensure_installed = {
			"bash",
			"dockerfile",
			"javascript",
			"query",
			"rust",
			"typescript",
			"zig",
			-- Lua
			"lua",
			"luadoc",
			"luap",
			-- Config
			"json",
			"ron",
			"toml",
			"yaml",
			-- Markup
			"html",
			"markdown",
			"markdown_inline",
			"regex",
			"vim",
			"vimdoc",
			-- Shaders
			"glsl",
			"wgsl_bevy",
			-- Go
			"go",
			"gomod",
			"gosum",
			"gowork",
		},
		highlight = { enable = true },
		indent = { enable = true },
		auto_install = true,
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
