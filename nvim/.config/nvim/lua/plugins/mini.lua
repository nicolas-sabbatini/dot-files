return {
	{
		"echasnovski/mini.bufremove",
		version = "*",
		keys = {
			{
				"<leader>bd",
				function()
					local delete = require("mini.bufremove").delete
					if vim.bo.modified then
						local choice =
							vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
						if choice == 1 then -- Yes
							vim.cmd.write()
							delete(0)
						elseif choice == 2 then -- No
							delete(0, true)
						end
					else
						delete(0)
					end
				end,
				desc = "Delete Buffer",
			},
			{
				"<leader>bD",
				function()
					require("mini.bufremove").delete(0, true)
				end,
				desc = "Delete Buffer (Force)",
			},
		},
	},
	{
		{
			"echasnovski/mini.surround",
			version = "*",
			opts = {
				custom_surroundings = nil,
				highlight_duration = 500,
				mappings = {
					add = "gsa", -- Add surrounding in Normal and Visual modes
					delete = "gsd", -- Delete surrounding
					find = "gsf", -- Find surrounding (to the right)
					find_left = "gsF", -- Find surrounding (to the left)
					highlight = "gsh", -- Highlight surrounding
					replace = "gsr", -- Replace surrounding
					update_n_lines = "gsn", -- Update `n_lines`

					suffix_last = "l", -- Suffix to search with "prev" method
					suffix_next = "n", -- Suffix to search with "next" method
				},
				n_lines = 20,
				respect_selection_type = false,
				search_method = "cover",
				silent = false,
			},
		},
	},
}
