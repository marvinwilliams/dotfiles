call plug#begin('.local/share/nvim/plugged')
    Plug '/usr/bin/fzf'
    Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh',
        \ }
    Plug 'honza/vim-snippets'
    Plug 'SirVer/ultisnips'
    Plug 'itchyny/lightline.vim'
    Plug 'junegunn/fzf.vim'
    Plug 'lervag/vimtex'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
call plug#end()

let mapleader = "\<Space>"
let localleader = ","

"Manage files
nnoremap <leader>f :find *

"Manage buffers
nnoremap gb :buffers<CR>:b<Space>
nnoremap <leader>b :buffer *

"Manage tabs
nnoremap <leader>ta :tabnew<CR>
nnoremap <leader>te :tabedit **/*
nnoremap <leader>tf :tabfind *
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>to :tabonly<CR>
nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>tp :tabprevious<CR>

"Fuzzy searching
nnoremap <silent> <leader>ff :FZFFiles<CR>
nnoremap <silent> <leader>fb :FZFBuffers<CR>
nnoremap <silent> <leader>fc :FZFColors<CR>
nnoremap <silent> <leader>fl :FZFBLines<CR>
nnoremap <silent> <leader>fL :FZFLines<CR>
nnoremap <silent> <leader>fh :FZFCommands<CR>
nnoremap <silent> <leader>fm :FZFMaps<CR>
nnoremap <silent> <leader>d. :cd .<CR>

"Compiling
inoremap <F5> <Esc>:write<Bar>silent make<Bar>cwindow<CR><CR>
nnoremap <F5> :write<Bar>silent make<Bar>cwindow<CR><CR>

"Language Server
nnoremap <silent> <leader>lh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <leader>ld :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <leader>lr :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> <leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>
nnoremap <silent> <leader>lR :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> <leader>lf :call LanguageClient#textDocument_formatting()<CR>
"Write as sudo
noremap <leader>W :w !sudo tee % > /dev/null<CR>

set termguicolors
set hidden
set number
set shiftwidth=4
let &softtabstop=&shiftwidth
set splitright
set splitbelow
set wildignorecase
set scrolloff=3
set incsearch
set smartcase
set lazyredraw
set cursorline
set noshowmode
set completeopt=menuone,preview,longest
set signcolumn=yes

set completefunc=LanguageClient#complete
set formatexpr=LanguageClient_textDocument_rangeFormatting()
let g:LanguageClient_loadSettings = 1
let g:LanguageClient_settingsPath = '/home/marvin/.config/nvim/settings.json'

colorscheme apprentice
let g:lightline = {
	    \ 'colorscheme': 'apprentice',
	    \ }

"Plugin settings
"FZF
augroup FzfFormat
    autocmd!
    autocmd FileType fzf set laststatus=0 noruler 
		\| autocmd BufLeave <buffer> set laststatus=2 ruler
augroup END

let g:fzf_command_prefix = 'FZF'
let g:fzf_layout = { 'down': '~30%' }

let g:fzf_colors =
	    \ { 'fg':    ['fg', 'Normal'],
	    \ 'bg':      ['bg', 'Normal'],
	    \ 'hl':      ['fg', 'Comment'],
	    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
	    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
	    \ 'hl+':     ['fg', 'Statement'],
	    \ 'info':    ['fg', 'PreProc'],
	    \ 'border':  ['fg', 'Ignore'],
	    \ 'prompt':  ['fg', 'Conditional'],
	    \ 'pointer': ['fg', 'Exception'],
	    \ 'marker':  ['fg', 'Keyword'],
	    \ 'spinner': ['fg', 'Label'],
	    \ 'header':  ['fg', 'Comment'] }

"LSP
let g:LanguageClient_serverCommands = {
    \ 'cpp': ['cquery', '--log-file=/tmp/cq.log'],
    \ 'python': ['pyls'],
    \ 'r': ['R', '--slave', '-e', 'languageserver::run()'],
    \ }

augroup LanguageClient_config
  au!
  au BufEnter * let b:Plugin_LanguageClient_started = 0
  au User LanguageClientStarted let b:Plugin_LanguageClient_started = 1
  au User LanguageClientStopped let b:Plugin_LanguageClient_stopped = 0
  au CursorMoved * if b:Plugin_LanguageClient_started | call LanguageClient_textDocument_hover() | endif
augroup END