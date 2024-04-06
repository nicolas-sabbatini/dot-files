local has_image_magick, _ = pcall(require, "magick")

return {
	"3rd/image.nvim",
	opts = {
		backend = "kitty",
		integrations = {
			markdown = {
				enabled = true,
				clear_in_insert_mode = false,
				download_remote_images = true,
				only_render_image_at_cursor = false,
				filetypes = { "markdown", "vimwiki", "md" },
			},
		},
		hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" },
	},
	config = function(_, opts)
		require("image").setup(opts)
	end,
	cond = has_image_magick,
}
