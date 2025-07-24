return {
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		opts = {
			ensure_installed = {
				-- Bash
				"bash-language-server",
				"shellcheck",
				"shfmt",
				-- TS
				"deno",
				-- Rust
				"rust-analyzer",
				"taplo",
				-- Lua
				"lua-language-server",
				"stylua",
				-- Markdown
				"marksman",
				-- Docker
				"hadolint",
				-- GSLS
				"glsl_analyzer",
				-- WSLS
				"wgsl-analyzer",
				-- Zig
				"zls",
				-- C
				"clang-format",
				"clangd",
				-- Go
				"goimports",
				"gopls",
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
	{ "williamboman/mason-lspconfig.nvim", opts = {} },
	{ "j-hui/fidget.nvim", opts = {} },
	{ "neovim/nvim-lspconfig" },
}
