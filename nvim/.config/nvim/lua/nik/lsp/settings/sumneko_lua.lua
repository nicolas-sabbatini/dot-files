return {
  settings = {
    Lua = {
      diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				  ["nik.lsp.settings.extras.pico8.lua"] = true,
        },
			},
      telemetry = {
            enable = false,
      },
    },
  },
}
