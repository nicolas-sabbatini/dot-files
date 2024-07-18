local function map(mode, lhs, rhs, opts)
	vim.tbl_deep_extend("force", { noremap = true, silent = true }, opts)
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- Split keymaps
map("n", "<C-h>", "<C-w>h", { desc = "Move left" })
map("n", "<C-j>", "<C-w>j", { desc = "Move down" })
map("n", "<C-k>", "<C-w>k", { desc = "Move up" })
map("n", "<C-l>", "<C-w>l", { desc = "Move right" })

map("n", "<leader>h", "<C-w>s", { desc = "Split horizontal" })
map("n", "<leader>v", "<C-w>v", { desc = "Split vertical" })

map("n", "<C-+>", "<C-w>+", { desc = "Increase heigth" })
map("n", "<C-->", "<C-w>-", { desc = "Decrease heigth" })
map("n", "<C->>", "<C-w>>", { desc = "Increase width" })
map("n", "<C-<>", "<C-w><", { desc = "Decrease width" })

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

map("i", "<C-h>", function()
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

-- Clear search highlight
map("n", "<leader>n", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })

-- Conform
map("n", "<leader>ccp", function()
	vim.g.prettier = not vim.g.prettier
	vim.print("Prettier is now: " .. tostring(vim.g.prettier))
end, { desc = "Toggle Prettier" })
map("n", "<leader>cct", function()
	vim.g.expand = not vim.g.expand
	vim.opt.expandtab = vim.g.expand
	vim.print("Expand tab is now: " .. tostring(vim.g.expand))
end, { desc = "Toggle Tabs" })
