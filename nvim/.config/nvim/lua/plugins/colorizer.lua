return {
	"NvChad/nvim-colorizer.lua",
	opts = {
		filetypes = { "*" },
		user_default_options = {
			RGB = true,
			RRGGBB = true,
			names = true,
			RRGGBBAA = true,
			AARRGGBB = true,
			rgb_fn = true,
			hsl_fn = true,
			css = true,
			css_fn = true,
			mode = "virtualtext",
			tailwind = true,
			sass = { enable = true, parsers = { "css" } },
			virtualtext = "■",
			always_update = true,
		},
	},
}
