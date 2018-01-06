syntax on

call plug#begin()

Plug 'ctrlpvim/ctrlp.vim'
Plug 'sbdchd/neoformat'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'lervag/vimtex'
Plug 'joshdick/onedark.vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'install.sh',
    \ }
Plug 'junegunn/fzf'
Plug 'roxma/nvim-completion-manager'
Plug 'roxma/ncm-clang'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'w0rp/ale'

call plug#end()

set spelllang=en,de
set backspace=eol,start,indent
set ignorecase
set incsearch
set shiftwidth=2
set tabstop=2

set showcmd
set ruler
set relativenumber
set number
set hlsearch
set lazyredraw
set showmatch
set noerrorbells
set novisualbell

set nobackup
set nowritebackup
set noswapfile

set background=dark
colorscheme onedark

let mapleader='\'
tnoremap <Esc> <C-\><C-n>

let g:tex_flavor='latex'
let g:airline_theme='bubblegum'
let g:airline#extensions#ale#enabled = 1
