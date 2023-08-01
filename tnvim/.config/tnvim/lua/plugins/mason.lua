return {
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
		opts = {
			ensure_installed = {
				-- Bash
				"bash-language-server",
				"shellcheck",
				"shfmt",
				-- TS
				"eslint-lsp",
				"prettierd",
				"typescript-language-server",
				"prisma-language-server",
				-- Rust
				"rust-analyzer",
				-- JSON
				"json-lsp",
				-- Lua
				"lua-language-server",
				"stylua",
				-- Markdown
				"marksman",
				-- Haskell
				"haskell-language-server",
				-- Docker
				"hadolint",
			},
		},
		config = function(_, opts)
			require("mason").setup(opts)
			local mr = require("mason-registry")
			local function ensure_installed()
				for _, tool in ipairs(opts.ensure_installed) do
					local p = mr.get_package(tool)
					if not p:is_installed() then
						p:install()
					end
				end
			end
			if mr.refresh then
				mr.refresh(ensure_installed)
			else
				ensure_installed()
			end
		end,
	},
	"williamboman/mason-lspconfig.nvim",
}
