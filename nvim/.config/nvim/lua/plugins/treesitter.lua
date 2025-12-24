return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		main = "nvim-treesitter.config",
		opts = {
			ensure_installed = {
				-- Lenguages
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
			},
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		},
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},
}
