compiler gcc
nnoremap <buffer> <leader>mm :make <bar>:cwindow<cr>
nnoremap <buffer> <leader>ma :make all <bar>:cwindow<cr>
nnoremap <buffer> <leader>mc :make clean<cr>
setlocal omnifunc=v:lua.vim.lsp.omnifunc
nnoremap <buffer> <leader>ig ionce<esc>:call vsnip#expand()<cr>MQ_<ESC>"=toupper(expand('%:r:gs/[^0-9a-zA-Z_]/_/'))<CR>pa_INCLUDED
