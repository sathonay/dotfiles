" vim settings
syntax on
set belloff=all
set hlsearch
set number
set relativenumber
set colorcolumn=81
" set autoindent
" set smartindent
set shiftwidth=0
set tabstop=4
set noexpandtab

" show spaces and tabs
nnoremap <space>s :set list<CR>
nnoremap <space>h :set nolist<CR>
set listchars=eol:⤸,tab:➜⠀,space:●

set clipboard=unnamed,unnamedplus

" colorscheme torte
colorscheme sorbet

" 42 header
let g:user42="alrey"
let g:mail42="alrey@student.42nice.fr"
" vim keybinds

" todo maybe replace cr by esc
nnoremap <silent> <CR> :noh<CR><CR>
" currently broken on ubuntu
" nnoremap <silent> <esc> :noh<CR><CR>

" Explorer conf
" let g:netrw_liststyle = 4
let g:netrw_banner=0
let g:netrw_liststyle = 3
let g:netrw_bufsettings = 'number relativenumber noma nomod nowrap ro nobl'

" finding files
set path+=**
set path+=/usr/include,/usr/local/include,inc,
" vim plugins
runtime ftplugin/man.vim

" select de previous buffer after moving txt
vnoremap > >gv
vnoremap < <gv
" no arrow keys :'/
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

" Nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
"autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif
