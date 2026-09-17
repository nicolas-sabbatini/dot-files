return {
	{
		"brenoprata10/nvim-highlight-colors",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			render = "background",
			virtual_symbol = "■",
			enable_tailwind = true,
		},
	},
}
