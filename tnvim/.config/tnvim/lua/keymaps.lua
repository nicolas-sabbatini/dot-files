local function map(mode, lhs, rhs, opts)
	vim.tbl_deep_extend("force", { noremap = true, silent = true }, opts)
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- LSP keymaps
map("n", "gld", function()
	vim.lsp.buf.definition()
end, { desc = "Go definition" })

map("n", "glD", function()
	vim.lsp.buf.declaration()
end, { desc = "Go declaration" })

map("n", "gli", function()
	vim.lsp.buf.implementation()
end, { desc = "Go implementation" })

map("n", "glo", function()
	vim.lsp.buf.type_definition()
end, { desc = "Go symbol definition" })

map("n", "glr", function()
	vim.lsp.buf.references()
end, { desc = "Go references" })

map("n", "gls", function()
	vim.lsp.buf.signature_help()
end, { desc = "Go signature help" })

map("n", "glc", function()
	vim.diagnostic.goto_prev()
end, { desc = "Go prev diagnostic" })

map("n", "gln", function()
	vim.diagnostic.goto_next()
end, { desc = "Go next diagnostic" })

map("n", "<leader>cr", function()
	vim.lsp.buf.rename()
end, { desc = "Rename symbol" })

map("n", "<leader>cf", function()
	vim.lsp.buf.formatting()
end, { desc = "Code format" })

map("n", "<leader>ca", function()
	vim.lsp.buf.code_action()
end, { desc = "Code action" })

map("n", "<leader>cd", function()
	vim.diagnostic.open_float()
end, { desc = "Line diagnostics" })

-- Explorer keymaps
map("n", "<leader>e", "<cmd>Ex<cr>", { desc = "Explorer" })

-- Clear search highlight
map("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })
