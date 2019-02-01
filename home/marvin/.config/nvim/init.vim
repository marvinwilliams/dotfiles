call plug#begin('~/.local/share/nvim/plugged')
Plug '~/.fzf'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf.vim'
Plug 'lervag/vimtex'
Plug 'PontusPersson/pddl.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'lervag/vimtex'
Plug 'Chiel92/vim-autoformat'
Plug 'vimwiki/vimwiki'
call plug#end()

let mapleader = "\<Space>"
let localleader = ","

"Manage tabs
nnoremap <leader>tc :tabnew<CR>
nnoremap <leader>te :tabedit **/*
nnoremap <leader>tf :tabfind *
nnoremap <leader>tx :tabclose<CR>
nnoremap <leader>to :tabonly<CR>
nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>tp :tabprevious<CR>

"Fuzzy searching
nnoremap <silent> <leader>ff :FZFFiles<CR>
nnoremap <silent> <leader>fb :FZFBuffers<CR>
nnoremap <silent> <leader>fc :FZFCommits<CR>
nnoremap <silent> <leader>fl :FZFBLines<CR>
nnoremap <silent> <leader>fL :FZFLines<CR>
nnoremap <silent> <leader>fh :FZFCommands<CR>
nnoremap <silent> <leader>fm :FZFMaps<CR>
nnoremap <silent> <leader>d. :cd .<CR>

nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gg :Gpull<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gl :Glog<CR>

"Coc
nmap <leader>ld <Plug>(coc-definition)
nmap <leader>lr <Plug>(coc-rename)
nmap <leader>lf <Plug>(coc-format)
nmap <leader>lt <Plug>(coc-type-definition)
nmap <leader>lx <Plug>(coc-references)
nmap <leader>li <Plug>(coc-implementation)
nmap <leader>la <Plug>(coc-codeaction)
nmap <leader>lh <Plug>(coc-diagnostic-info)
nmap <leader>ln <Plug>(coc-diagnostic-next)
nmap <leader>lp <Plug>(coc-diagnostic-prev)

"Write as sudo
noremap <leader>w :w !sudo tee % > /dev/null<CR>

nnoremap <leader>wr :%s/<c-r>=expand("<cword>")<cr>//g<left><left>
nnoremap <leader>wx dawwP
nnoremap <leader>wX dawbP

set completeopt=menuone,preview,longest
set cursorline
set expandtab
set hidden
set incsearch
set lazyredraw
set noshowmode
set number
set scrolloff=3
set sidescrolloff=3
set shiftwidth=2
set signcolumn=yes
set smartcase
set softtabstop=2
set splitbelow
set splitright
set tabstop=4
set termguicolors
set wildignorecase
set list
set lcs=tab:>·,trail:·,precedes:«,extends:»
set nowrap
set nohlsearch
set colorcolumn=80
set mouse=a
set undofile
set pumheight=10
set noswapfile
set suffixes=.o,.pdf,.a,.jpg,.png,.git
set wildignore=.o,.pdf,.a,.jpg,.png,.git
set wildmode=longest:full,full
set autoread

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

let g:tex_flavor='latex'
autocmd FileType tex setlocal spell spelllang=de,en
