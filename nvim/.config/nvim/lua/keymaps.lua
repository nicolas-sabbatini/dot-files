local function map(mode, lhs, rhs, opts)
	opts = vim.tbl_deep_extend("force", { noremap = true, silent = true }, opts or {})
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- Split keymaps
map("n", "<C-h>", "<C-w>h", { desc = "Move left" })
map("n", "<C-j>", "<C-w>j", { desc = "Move down" })
map("n", "<C-k>", "<C-w>k", { desc = "Move up" })
map("n", "<C-l>", "<C-w>l", { desc = "Move right" })

map("n", "<leader>h", "<C-w>s", { desc = "Split horizontal" })
map("n", "<leader>v", "<C-w>v", { desc = "Split vertical" })

map("n", "<C-Up>", "<C-w>+", { desc = "Increase heigth" })
map("n", "<C-Down>", "<C-w>-", { desc = "Decrease heigth" })
map("n", "<C-Right>", "<C-w>>", { desc = "Increase width" })
map("n", "<C-Left>", "<C-w><", { desc = "Decrease width" })

-- Diagnostic keymaps (global — diagnostics can also come from linters, not only LSP)
map("n", "glp", function()
	vim.diagnostic.jump({ count = -1 })
end, { desc = "Go prev diagnostic" })

map("n", "gln", function()
	vim.diagnostic.jump({ count = 1 })
end, { desc = "Go next diagnostic" })

map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line diagnostics" })

-- LSP keymaps: registered per-buffer on LspAttach
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("user_lsp_keymaps", { clear = true }),
	callback = function(args)
		local buf = args.buf
		map("n", "gld", vim.lsp.buf.definition, { buffer = buf, desc = "Go definition" })
		map("n", "glD", vim.lsp.buf.declaration, { buffer = buf, desc = "Go declaration" })
		map("n", "gli", vim.lsp.buf.implementation, { buffer = buf, desc = "Go implementation" })
		map("n", "glo", vim.lsp.buf.type_definition, { buffer = buf, desc = "Go symbol definition" })
		map("n", "glr", vim.lsp.buf.references, { buffer = buf, desc = "Go references" })
		map("i", "<C-h>", vim.lsp.buf.signature_help, { buffer = buf, desc = "Signature help" })
		map("n", "<leader>cr", vim.lsp.buf.rename, { buffer = buf, desc = "Rename symbol" })
		map("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = buf, desc = "Code action" })
	end,
})

-- Clear search highlight
map("n", "<leader>n", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })

-- Conform
map("n", "<leader>ccp", function()
	vim.g.prettier = not vim.g.prettier
	vim.print("Prettier is now: " .. tostring(vim.g.prettier))
end, { desc = "Toggle Prettier" })
