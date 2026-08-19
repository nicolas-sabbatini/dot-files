return {
	"hat0uma/csvview.nvim",
	opts = {
		parser = { comments = { "#" } },
		view = { display_mode = "border" }, -- Shows explicit '│' borders
	},
	cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
}
