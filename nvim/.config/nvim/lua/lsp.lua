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
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name
			if
				path ~= vim.fn.stdpath("config")
				and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
			then
				return
			end
		end
		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
			runtime = {
				version = "LuaJIT",
				path = {
					"lua/?.lua",
					"lua/?/init.lua",
					"src/?.lua",
					"src/?/init.lua",
					"?.lua",
					"?/init.lua",
				},
			},
			workspace = {
				checkThirdParty = true,
				telemetry = { enable = false },
				library = {
					vim.env.VIMRUNTIME,
					"${3rd}/love2d/library",
					vim.fn.expand("$VIMRUNTIME/lua"),
					vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
				},
			},
		})
	end,
	settings = {
		Lua = {},
	},
})
