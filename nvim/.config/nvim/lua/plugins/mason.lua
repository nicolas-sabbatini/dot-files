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
				"prettier",
				"typescript-language-server",
				-- Rust
				"rust-analyzer",
				"taplo",
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
				-- Go
				"goimports",
				"gopls",
				-- GSLS
				"glsl_analyzer",
				-- WSLS
				"wgsl-analyzer",
				-- Zig
				"zls",
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
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						require("lspconfig")[server_name].setup({})
					end,
					rust_analyzer = function()
						require("lspconfig").rust_analyzer.setup({
							settings = {
								["rust-analyzer"] = {
									cargo = {
										allFeatures = true,
										loadOutDirsFromCheck = true,
										runBuildScripts = true,
									},
									check = {
										command = "clippy",
										extraArgs = { "--no-deps", "--", "-W", "clippy::pedantic" },
									},
								},
							},
						})
					end,
					lua_ls = function()
						require("lspconfig").lua_ls.setup({
							settings = {
								Lua = {
									runtime = {
										version = "LuaJIT",
									},
									workspace = {
										checkThirdParty = true,
										telemetry = { enable = false },
										library = {
											"${3rd}/love2d/library",
											vim.fn.expand("$VIMRUNTIME/lua"),
											vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
										},
									},
								},
								globals = { "vim" },
							},
						})
					end,
					eslint = function()
						require("lspconfig").eslint.setup({
							on_attach = function(client, bufnr)
								vim.api.nvim_create_autocmd("BufWritePre", {
									buffer = bufnr,
									command = "EslintFixAll",
								})
							end,
						})
					end,
				},
			})
		end,
	},
}
