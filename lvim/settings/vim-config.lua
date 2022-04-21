-- For more help use
-- :help opt
--
vim.opt.backup = false -- Don't make a backup before overwriting a file
vim.opt.clipboard = "unnamedplus" -- Allows neovim to access the system clipboard
vim.opt.cmdheight = 2 -- Height of the cmd
vim.opt.confirm = true -- Operations that would normally fail because of unsaved changes
-- to a buffer raise a dialog asking if you wish to save
-- the current file(s)
vim.opt.conceallevel = 0 -- `` is visible in markdown files
vim.opt.completeopt = { "menuone", "noselect" } -- Mostly just for cmp
vim.opt.cursorline = true -- Show cursorline
vim.opt.cursorlineopt = "both" -- Cursorline highlight text and number
vim.opt.debug = "msg" -- Show error messages
vim.opt.emoji = true -- 😁
vim.opt.errorbells = false -- No sound
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.fileencoding = "utf-8" -- The encoding written to a file
vim.opt.hidden = true -- Hiden insted of closed
vim.opt.history = 5000 -- : history size
vim.opt.hlsearch = true -- Highlight all matches on previous search pattern
vim.opt.icon = true -- Text of the window will be set to the name of the file being edited
vim.opt.ignorecase = true -- Ignore case in search patterns
vim.opt.mouse = "a" -- Allow the mouse
vim.opt.number = true -- Numbered lines
vim.opt.numberwidth = 4 -- Number column width 4
vim.opt.pumheight = 15 -- Pop up menu height
vim.opt.relativenumber = false -- Don't show relative numbers
vim.opt.ruler = true -- Show the line and column number of the cursor positions
vim.opt.scrolloff = 8 -- Minimal number of screen lines to keep above and below the cursor
vim.opt.shiftround = true -- Round indent to multiple of 'shiftwidth'
vim.opt.shiftwidth = 2 -- The number of spaces inserted for each indentation
vim.opt.shortmess:append "c" -- ?? Recomende but i don't know why
vim.opt.showbreak = "➡️ " -- String to put at the start of lines that have been wrapped
vim.opt.showmode = false -- Don' show mode
vim.opt.showtabline = 2 -- Always show tabs
vim.opt.sidescrolloff = 4 -- Minimal number of screen columns to keep left and right the cursor
vim.opt.signcolumn = "yes" -- Always show the sign column, otherwise it would shift
-- the text each time
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.spell = false -- Turn off spell lang
vim.opt.spelllang = "es,en" -- Spell language
vim.opt.splitbelow = true -- Force all horizontal splits to go below current window
vim.opt.splitright = true -- Force all vertical splits to go to the right of current window
vim.opt.swapfile = false -- Don't create a swapfile
vim.opt.tabstop = 2 -- Insert 2 spaces for a tab
vim.opt.termguicolors = true -- Colors!! 🎨
vim.opt.timeoutlen = 0 -- Time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true -- Enable persistent undo
vim.opt.updatetime = 300 -- Faster completion
vim.opt.wrap = false -- Break display lines
vim.opt.writebackup = false -- If a file is being edited by anotherprogram (or was written to
-- file while editing with another program), it is not allowed to
-- be edited
-- ?? I don't know why
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
