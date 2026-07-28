return {
	"saghen/blink.cmp",
	version = "*",
	dependencies = {
		{ "L3MON4D3/LuaSnip", version = "v2.*" },
	},
	event = "InsertEnter",
	opts = {
		keymap = {
			preset = "none",
			["<C-y>"] = { "select_and_accept" },
			["<C-e>"] = { "hide", "fallback" },
			["<C-h>"] = { "select_prev", "fallback" },
			["<C-l>"] = { "select_next", "fallback" },
			["<C-j>"] = { "scroll_documentation_down", "fallback" },
			["<C-k>"] = { "scroll_documentation_up", "fallback" },
		},
		snippets = { preset = "luasnip" },
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		completion = {
			documentation = { auto_show = false },
			menu = {
				draw = {
					columns = {
						{ "label", "label_description", gap = 1 },
						{ "kind_icon", "kind" },
					},
				},
			},
		},
	},
	opts_extend = { "sources.default" },
}
