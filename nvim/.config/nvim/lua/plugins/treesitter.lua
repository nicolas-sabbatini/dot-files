local function have_entry(target, table)
	for _, v in pairs(table) do
		if v == target then
			return true
		end
	end
	return false
end

return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		branch = "main",
		lazy = false,
		cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
		config = function()
			require("nvim-treesitter").setup()
			local ensure_installed = {
				"bash",
				"dockerfile",
				"javascript",
				"query",
				"rust",
				"typescript",
				"zig",
				"c",
				"json",
				"lua",
				"luadoc",
				"luap",
				"ron",
				"toml",
				"yaml",
				"html",
				"markdown",
				"markdown_inline",
				"regex",
				"vim",
				"vimdoc",
				"diff",
				"glsl",
				"gdscript",
				"godot_resource",
			}
			local installed = require("nvim-treesitter").get_installed("parsers")

			for _, parser in pairs(ensure_installed) do
				if not have_entry(parser, installed) then
					require("nvim-treesitter").install(parser)
				end
			end

			installed = require("nvim-treesitter").get_installed("parsers")

			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("lazyvim_treesitter", { clear = true }),
				callback = function(ev)
					local ft = ev.match
					if not have_entry(ft, installed) then
						return
					end

					pcall(vim.treesitter.start, ev.buf)
					local ok, indent = pcall(vim.treesitter.indentexpr)
					if ok and indent then
						vim.bo[ev.buf].indentexpr = "v:lua.vim.treesitter.indentexpr()"
					end
					if vim.treesitter.foldexpr then
						-- Schedule so we can resolve the actual window showing
						-- this buffer instead of assuming win=0 is correct.
						vim.schedule(function()
							local win = vim.fn.bufwinid(ev.buf)
							if win == -1 then
								return
							end
							vim.api.nvim_set_option_value("foldmethod", "expr", { win = win })
							vim.api.nvim_set_option_value(
								"foldexpr",
								"v:lua.vim.treesitter.foldexpr()",
								{ win = win }
							)
						end)
					end
				end,
			})
		end,
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},
}
