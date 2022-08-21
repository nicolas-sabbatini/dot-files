-- Options for keys map, non recursive, don't show
local options = { noremap = true, silent = true }
local terminal_options = { silent = true }
-- Shorten function name
local keymap = vim.api.nvim_set_keymap
--Remap space as leader key
keymap("", "<Space>", "<Nop>", options)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
-- Change split Ctrl+[h|j|k|l]
keymap("n", "<C-h>", "<C-w>h", options)
keymap("n", "<C-j>", "<C-w>j", options)
keymap("n", "<C-k>", "<C-w>k", options)
keymap("n", "<C-l>", "<C-w>l", options)
-- <Space + e> open explorer
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", options)
keymap("n", "<leader>r", ":NvimTreeRefresh<cr>", options)
-- Split resize
keymap("n", "<A-Up>", ":resize -1<CR>", options)
keymap("n", "<A-Down>", ":resize +1<CR>", options)
keymap("n", "<A-Left>", ":vertical resize +1<CR>", options)
keymap("n", "<A-Right>", ":vertical resize -1<CR>", options)
-- Buffer navigation
keymap("n", "<S-l>", ":bnext<CR>", options)
keymap("n", "<S-h>", ":bprevious<CR>", options)
-- No Highlight
keymap("n", "<leader>h", ":nohlsearch<CR>", options)
-- Close Buffer
keymap("n", "<leader>c", ":Bdelete<CR>", options)
-- TODO plugin
keymap("n", "<leader>tq", ":TodoQuickFix<CR>", options)
keymap("n", "<leader>tt", ":TodoTelescope", options)

-- Insert --
-- End of the line
keymap("i", "<C-E>", "<ESC>A", options);
keymap("i", "<C-A>", "<ESC>I", options);

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", options)
keymap("v", ">", ">gv", options)
-- <Alt + [j|k]> text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", options)
keymap("v", "<A-k>", ":m .-2<CR>==", options)
-- When paste don't yank
keymap("v", "p", '"_dP', options)

-- Visual block --
-- <Alt + [j|k]> text up and down
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", options)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", options)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", terminal_options)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", terminal_options)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", terminal_options)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", terminal_options)
