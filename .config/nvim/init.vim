syntax on

call plug#begin()

Plug 'ctrlpvim/ctrlp.vim'
Plug 'sbdchd/neoformat'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-repeat'
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
Plug 'chrisbra/Colorizer'

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
let g:airline_theme='onedark'
let g:airline_powerline_fonts=1
let g:airline#extensions#ale#enabled=1
let g:ale_lint_on_text_changed='normal'
let g:ale_lint_on_insert_leave=1
let g:ale_sign_column_always=1
