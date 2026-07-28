return {
	"3rd/image.nvim",
	build = false,
	ft = { "markdown", "vimwiki", "md" },
	event = {
		"BufReadPre *.png",
		"BufReadPre *.jpg",
		"BufReadPre *.jpeg",
		"BufReadPre *.gif",
		"BufReadPre *.webp",
		"BufReadPre *.avif",
	},
	opts = {
		backend = "kitty",
		processor = "magick_cli",
		integrations = {
			markdown = {
				enabled = true,
				clear_in_insert_mode = false,
				download_remote_images = true,
				only_render_image_at_cursor = false,
				filetypes = { "markdown", "vimwiki", "md" },
			},
		},
		hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
	},
}
