" ███    ██ ██ ██   ██          ██████  ██████  ██████  ███████ ███████ 
" ████   ██ ██ ██  ██          ██      ██    ██ ██   ██ ██      ██      
" ██ ██  ██ ██ █████           ██      ██    ██ ██   ██ █████   ███████ 
" ██  ██ ██ ██ ██  ██          ██      ██    ██ ██   ██ ██           ██ 
" ██   ████ ██ ██   ██ ███████  ██████  ██████  ██████  ███████ ███████ 
"
" MIT License
" 
" Copyright (c) 2020 Nicolas
" 
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
" 
" The above copyright notice and this permission notice shall be included in all
" copies or substantial portions of the Software.
" 
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
" SOFTWARE.
"

""" Basic usage variables.
set title  " Display name of file.
set number  " Show line number.
set mouse=a  " Mouse integration.

set nowrap  " If the line is to long don't warp.

" Indentation.
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab " Insert spaces instead of tabs.

set hidden  " Allow buffer switching without save.

set spelllang=en,es  " Spelling.
set spell " Always turned on.

""" Custom shortcuts.
let g:mapleader = '.'

" Save alt+s.
nnoremap <M-s> :w<CR>

" Copy to clip board alt + c.
vnoremap <M-c> "+y
nnoremap <M-c> "+y

" Cut to clip board alt + x.
vnoremap <M-x> "+d
nnoremap <M-x> "+d

" Paste from clip board alt + v.
nnoremap <M-v> "+p
vnoremap <M-v> "+p
nnoremap <M-V> "+P
vnoremap <M-V> "+P

" Next buffer alt + l.
nnoremap <M-Right> :bnext<CR>

" Previous buffer alt + j.
nnoremap <M-Left> :bprevious<CR>

" Close current buffer alt + q.
nnoremap <M-q> :bdelete<CR>

""" Plugging.
call plug#begin()
"" Autocomplete.
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'nvim-lua/completion-nvim'
Plug 'dense-analysis/ale'

"" Better search.
" Super fast movement with vim-sneak.
Plug 'justinmk/vim-sneak'
" Clear highlight search automatically for you.
Plug 'romainl/vim-cool'
" Show current search term in different color.
Plug 'PeterRincker/vim-searchlight'
" Show match number for incsearch.
Plug 'osyo-manga/vim-anzu'
" Stay after pressing * and search selected text
Plug 'haya14busa/vim-asterisk'
" File search, tag search and more
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

"" URL handle.
" Highlight URL inside Vim.
Plug 'itchyny/vim-highlighturl'
" Open an URL in the browser.
Plug 'tyru/open-browser.vim'

"" Markdown manipulation.
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
" Faster footnote generation.
Plug 'vim-pandoc/vim-markdownfootnotes', { 'for': 'markdown' }
" Vim tabular plugging for manipulate tabular, required by markdown pluggings.
Plug 'godlygeek/tabular', {'on': 'Tabularize'}
" Markdown JSON header highlight plugging.
Plug 'elzr/vim-json', { 'for': ['json', 'markdown'] }
" Markdown previewing.
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" Unicode
Plug 'chrisbra/unicode.vim'

call plug#end()

""" Plugging settings.
"" Autocomplete.
" Enable syntax highlighting and file type identification, plugin and indenting
syntax enable
filetype plugin indent on

"""""""""""""""""""""""""""""" lsp settings """""""""""""""""""""""
" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

" Configure LSP
lua <<EOF

-- nvim_lsp object
local nvim_lsp = require'lspconfig'

-- function to attach completion when setting up lsp
local on_attach = function(client)
    require'completion'.on_attach(client)
end

-- Enable rust_analyzer
nvim_lsp.rust_analyzer.setup({ on_attach=on_attach })

-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)
EOF

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" use <Tab> as trigger keys
imap <Tab> <Plug>(completion_smart_tab)
imap <S-Tab> <Plug>(completion_smart_s_tab)


" Code navigation shortcuts
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>

" Code actions.
nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300
" Show diagnostic popup on cursor hold
autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" have a fixed column for the diagnostics to appear in
" this removes the jitter when warnings/errors flow in
set signcolumn=yes

" Enable type inlay hints
autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
\ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"} }

"""""""""""""""""""""""""""""" ale settings """""""""""""""""""""""
" linters for different filetypes
let g:ale_linters = {
  \ }

" Only run linters in the g:ale_linters dictionary
let g:ale_linters_explicit = 1

" Linter signs
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '!'

""" Search settings.
"""""""""""""""""""""""""""""vim-sneak settings"""""""""""""""""""""""
" Use sneak label mode
let g:sneak#label = 1

nmap f <Plug>Sneak_s
xmap f <Plug>Sneak_s
onoremap <silent> f :call sneak#wrap(v:operator, 2, 0, 1, 1)<CR>
nmap F <Plug>Sneak_S
xmap F <Plug>Sneak_S
onoremap <silent> F :call sneak#wrap(v:operator, 2, 1, 1, 1)<CR>

" Immediately after entering sneak mode, you can press f and F to go to next
" or previous match
let g:sneak#s_next = 1

"""""""""""""""""""""""""""""vim-anzu settings"""""""""""""""""""""""
nmap n <Plug>(anzu-n-with-echo)zzzv
nmap N <Plug>(anzu-N-with-echo)zzzv

" Maximum number of words to search
let g:anzu_search_limit = 500000

" Message to show for search pattern
let g:anzu_status_format = '/%p [%i/%l]'

"""""""""""""""""""""""""""""vim-asterisk settings"""""""""""""""""""""
nmap *  <Plug>(asterisk-z*)
nmap #  <Plug>(asterisk-z#)
xmap *  <Plug>(asterisk-z*)
xmap #  <Plug>(asterisk-z#)

"""""""""""""""""""""""""""""LeaderF settings"""""""""""""""""""""
" Do not use cache file
let g:Lf_UseCache = 0
" Refresh each time we call leaderf
let g:Lf_UseMemoryCache = 0

" Ignore certain files and directories when searching files
let g:Lf_WildIgnore = {
  \ 'dir': ['.git', '__pycache__', '.DS_Store'],
  \ 'file': ['*.exe', '*.dll', '*.so', '*.o', '*.pyc', '*.jpg', '*.png',
  \ '*.gif', '*.svg', '*.ico', '*.db', '*.tgz', '*.tar.gz', '*.gz',
  \ '*.zip', '*.bin', '*.pptx', '*.xlsx', '*.docx', '*.pdf', '*.tmp',
  \ '*.wmv', '*.mkv', '*.mp4', '*.rmvb', '*.ttf', '*.ttc', '*.otf',
  \ '*.mp3', '*.aac']
  \}

" Only fuzzy-search files names
let g:Lf_DefaultMode = 'NameOnly'

" Popup window settings
let g:Lf_PopupWidth = 0.5
let g:Lf_PopupPosition = [0, &columns/4]

" Do not use version control tool to list files under a directory since
" submodules are not searched by default.
let g:Lf_UseVersionControlTool = 0

" Disable default mapping
let g:Lf_ShortcutF = ''
let g:Lf_ShortcutB = ''

" set up working directory for git repository
let g:Lf_WorkingDirectoryMode = 'a'

" Search files in popup window
nnoremap <silent> <leader>f :<C-U>Leaderf file --popup<CR>
" Search vim help files
nnoremap <silent> <leader>h :<C-U>Leaderf help --popup<CR>
" Search tags in current buffer
nnoremap <silent> <leader>t :<C-U>Leaderf bufTag --popup<CR>

""" URL settings.
""""""""""""""""""""""""""""open-browser.vim settings"""""""""""""""""""
" Disable netrw's gx mapping.
let g:netrw_nogx = 1

" Use another mapping for the open URL method
nmap ob <Plug>(openbrowser-smart-search)
xmap ob <Plug>(openbrowser-smart-search)

""" Markdown settings.
"""""""""""""""""""""""""plasticboy/vim-markdown settings"""""""""""""""""""
" Disable header folding
let g:vim_markdown_folding_disabled = 1

" Whether to use conceal feature in markdown
let g:vim_markdown_conceal = 1

" Disable math tex conceal and syntax highlight
let g:tex_conceal = ''
let g:vim_markdown_math = 0

" Support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format

" Let the TOC window autofit so that it doesn't take too much space
let g:vim_markdown_toc_autofit = 1

"""""""""""""""""""""""""markdown-preview settings"""""""""""""""""""
" Do not close the preview tab when switching to other buffers
let g:mkdp_auto_close = 0

" Shortcuts to start and stop markdown previewing
nnoremap <silent> <M-m> :<C-U>MarkdownPreview<CR>
nnoremap <silent> <M-S-m> :<C-U>MarkdownPreviewStop<CR>

""""""""""""""""""""""""unicode.vim settings""""""""""""""""""""""""""""""
nmap ga <Plug>(UnicodeGA)

""" NEOVIDE CONFIG
let g:neovide_refresh_rate=30
let g:neovide_cursor_animation_length=0.13
let g:neovide_cursor_vfx_mode = "pixiedust"

set guifont="Fira Code"



