vim.lsp.config("rust_analyzer", {
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

vim.lsp.config("lua_ls", {
	root_dir = vim.fs.root(0, { ".git", ".luarc.json", "src" }),
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = {
					"?.lua",
					"?/init.lua",
					"lua/?.lua",
					"lua/?/init.lua",
					"src/?.lua",
					"src/?/init.lua",
				},
			},
			workspace = {
				checkThirdParty = true,
				telemetry = { enable = false },
				library = {
					vim.env.VIMRUNTIME,
					"${3rd}/love2d/library",
					"${3rd}/busted/library",
					"${3rd}/luassert/library",
					vim.fn.expand("$VIMRUNTIME/lua"),
					vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
				},
			},
		},
	},
})
