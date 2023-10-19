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
		"echasnovski/mini.comment",
		version = "*",
		config = function()
			require("mini.comment").setup({
				mappings = {
					comment = "sc", -- toggle comment
					comment_line = "scc", -- comment line
					textobject = "sc", -- comment text object
				},
			})
		end,
	},
	{
		{
			"echasnovski/mini.surround",
			version = "*",
			config = function()
				require("mini.surround").setup({
					mappings = {
						add = "sa", -- Add surrounding in Normal and Visual modes
						delete = "sd", -- Delete surrounding
						find = "sf", -- Find surrounding (to the right)
						find_left = "sF", -- Find surrounding (to the left)
						highlight = "sh", -- Highlight surrounding
						replace = "sr", -- Replace surrounding
						update_n_lines = "sn", -- Update `n_lines`

						suffix_last = "l", -- Suffix to search with "prev" method
						suffix_next = "n", -- Suffix to search with "next" method
					},
				})
			end,
		},
	},
}
