set autoread
set completeopt=menuone,noinsert,noselect
set cursorline
set expandtab
set hidden
set incsearch
set lazyredraw
set lcs=tab:>·,trail:·,precedes:«,extends:»
set list
set mouse=a
set nohlsearch
set noshowmode
set noswapfile
set nowrap
set number
set pumheight=10
set scrolloff=3
set shiftwidth=2
set shortmess+=c
set sidescrolloff=3
set signcolumn=yes
set smartcase
set softtabstop=2
set splitbelow
set splitright
set suffixes=.o,.pdf,.a,.jpg,.png,.git
set tabstop=4
set termguicolors
set undofile
set wildignore=.o,.pdf,.a,.jpg,.png,.git
set wildignorecase
set wildmode=longest:full,full

let mapleader = "\<Space>"
let localleader = ","

packadd! termdebug
packadd! matchit

let g:termdebug_wide=1

let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20


colorscheme PaperColor
set background=light

"Misc
nnoremap <leader>rc :e $MYVIMRC<cr>
inoremap {; {<CR>};<ESC>O
inoremap {<CR> {<CR>}<ESC>O
nnoremap <leader>ct :!ctags -R<cr>
nnoremap <leader>w :w !sudo tee % > /dev/null<CR>
nnoremap <leader>wr :%s/\<<c-r>=expand("<cword>")<cr>\>//g<left><left>
nnoremap <silent> <leader>cd :cd %:h<CR>
nnoremap <leader>pt "=strftime('%H:%M')<CR>p

"tnoremap <ESC> <C-\><C-n>

"Make
nnoremap <leader>mm :make<cr>
nnoremap <leader>ml :!pdflatex %<cr>
nnoremap <leader>ma :make all<cr>
nnoremap <leader>mc :make clean<cr>
nnoremap <leader>mi :make install<cr>

"Tabs
nnoremap <leader>tc :tabnew<CR>
nnoremap <leader>te :tabedit **/*
nnoremap <leader>tf :tabfind *
nnoremap <leader>tq :tabclose<CR>
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

"Git
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gg :Git pull<CR>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gl :Gclog<CR>

"Lsp
nnoremap <silent> <leader>lD    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <leader>ld    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>la    <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <leader>lh    <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>li    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <leader>ls    <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <leader>lt    <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> <leader>lr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>lw    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> <leader>lW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> <leader>lf    <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> <leader>ln    <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> <leader>lp    <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <leader>le    <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <silent> <leader>ll    <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>

"Debug
nnoremap <leader>dd :Termdebug<CR>i
nnoremap <leader>dr :call TermDebugSendCommand("run")<CR>
nnoremap <leader>dn :call TermDebugSendCommand("next")<CR>
nnoremap <leader>df :call TermDebugSendCommand("finish")<CR>
nnoremap <leader>ds :call TermDebugSendCommand("step")<CR>
nnoremap <leader>dc :call TermDebugSendCommand("continue")<CR>
nnoremap <leader>dbb :call TermDebugSendCommand("break " . shellescape(expand('%:t')) . ":" . line("."))<CR>
nnoremap <leader>dbc :call TermDebugSendCommand("clear " . shellescape(expand('%:t')) . ":" . line("."))<CR>
nnoremap <leader>dq :call TermDebugSendCommand("quit")<CR><CR>
nnoremap <leader>de :Eval<CR>
nnoremap <leader>dx :Stop<CR>
nnoremap <leader>dP :Program<CR>
nnoremap <leader>dS :Source<CR>
nnoremap <leader>dG :Gdb<CR>

imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <silent> <c-space> <Plug>(completion_trigger)

"Plugin settings

function! LspStatus() abort
    if luaeval('#vim.lsp.buf_get_clients() > 0')
       let errors = luaeval("vim.lsp.diagnostic.get_count(vim.fn.bufnr('%'), [[Error]])")
       let warnings = luaeval("vim.lsp.diagnostic.get_count(vim.fn.bufnr('%'), [[Warning]])")
       if errors == 0 && warnings == 0
         return ''
       else
         return errors . ' ' . warnings . ' '
       endif
     endif
     return ''
endfunction

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
" call coc#config('latex', {'latex.forwardSearch.executable': 'zathura'})

autocmd FileType tex setlocal spell spelllang=de,en

" let g:vimwiki_list = [{'path': '~/vimwiki'}, {'path': '~/Development/master_thesis/'}]

function! WikiRoot()
  let l:local_wiki = finddir('wiki', ';./')
  return !empty(l:local_wiki) ? l:local_wiki : '~/wiki'
endfunction

let g:wiki_root = 'WikiRoot'

lua << EOF
local lsp_status = require('lsp-status')
lsp_status.register_progress()
lsp_status.config({
    indicator_errors = 'E',
    indicator_warnings = 'W',
    indicator_info = 'i',
    indicator_hint = '?',
    indicator_ok = 'Ok',
  })

local lspconfig = require('lspconfig')

lspconfig.clangd.setup({
  handlers = lsp_status.extensions.clangd.setup(),
  init_options = {
    clangdFileStatus = true
  },
  cmd = {"clangd", "--background-index",  "-std=c++17"},
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilities
})

require 'lspconfig'.bashls.setup{}
require 'lspconfig'.pyls.setup{}
require 'lspconfig'.cmake.setup{}
require 'lspconfig'.r_language_server.setup{}
EOF

"autocmd User LspDiagnosticsChanged call lightline#update()
autocmd BufEnter * lua require'completion'.on_attach()
" let g:completion_enable_snippet = 'vim-vsnip'
let g:completion_confirm_key = "\<C-y>"
let g:completion_enable_auto_popup = 0
