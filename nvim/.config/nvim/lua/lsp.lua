vim.lsp.config("*", {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
})

vim.lsp.config("lua_ls", {
	root_dir = function(bufnr, cb)
		cb(vim.fs.root(bufnr, { ".git", ".luarc.json", "src" }))
	end,
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
				checkThirdParty = false,
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

vim.lsp.enable({ "lua_ls" })
