call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
call plug#end()

syntax on
set wrap
set mouse=a
set number

" Always show statusline
set laststatus=2

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline_powerline_fonts=1

set encoding=utf-8
set guifont=ProFont\ for\ Powerline:h10
let g:Powerline_symbols = 'fancy'

set t_Co=256
set fillchars+=stl:\ ,stlnc:\

set termencoding=utf-8

" Tema
" colorscheme monokai
let g:airline_theme='powerlineish'

