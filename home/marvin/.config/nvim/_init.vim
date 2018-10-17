syntax on

call plug#begin()

Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/denite.nvim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'sbdchd/neoformat'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-repeat'
Plug 'lervag/vimtex'
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim',{'as':'dracula'}
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'install.sh',
    \ }
Plug 'maximbaz/lightline-ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'w0rp/ale'
Plug 'chrisbra/Colorizer'
Plug 'robertmeta/nofrils'

call plug#end()

set spelllang=en,de
set backspace=eol,start,indent
set whichwrap+=<,>
set wrap
set ignorecase
set incsearch
set smartcase
set shiftwidth=4
set tabstop=4
set softtabstop=4
set noexpandtab
set scrolloff=2
set smartindent

set showcmd
set ruler
set relativenumber
set number
set hlsearch
set lazyredraw
set showmatch
set noerrorbells
set novisualbell
set wildmenu
set wildignorecase
set wildignore=*.o,*.a,*.so,*.swp,*.jpg,*.png,*.pdf
set list
set t_Co=256
set cursorline

set nobackup
set nowritebackup
set noswapfile

set background=dark
colorscheme onedark

let mapleader='\'
tnoremap <Esc> <C-\><C-n>
noremap <Leader>W :w !sudo tee % > /dev/null<CR>


let g:tex_flavor='latex'
let g:deoplete#enable_at_startup = 1
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }
"let g:lightline.component_expand = {
"      \  'linter_checking': 'lightline#ale#checking',
"      \  'linter_warnings': 'lightline#ale#warnings',
"      \  'linter_errors': 'lightline#ale#errors',
"      \  'linter_ok': 'lightline#ale#ok',
"      \ }
"let g:lightline.component_type = {
"      \     'linter_checking': 'left',
"      \     'linter_warnings': 'warning',
"      \     'linter_errors': 'error',
"      \     'linter_ok': 'left',
"      \ }
"let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]] }
let g:ale_lint_on_text_changed='normal'
let g:ale_lint_on_insert_leave=1
let g:ale_sign_column_always=1
