" vim settings
syntax on
set visualbell
set hlsearch
set number
set relativenumber

" vim keybinds

" todo maybe replace cr by esc
" nnoremap <silent> <CR> :noh<CR><CR>
nnoremap <silent> <esc> :noh<CR><CR>

" Explorer conf
" let g:netrw_liststyle = 4
let g:netrw_banner=0
let g:netrw_liststyle = 3
let g:netrw_bufsettings = 'number relativenumber noma nomod nowrap ro nobl'

" finding files
set path+=**
" nnoremap <C-p> :find

" vim plugins
runtime ftplugin/man.vim
