execute pathogen#infect()
syntax on
syntax enable
filetype plugin indent on

set encoding=utf-8
set wrap
set mouse=a
set number

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 1

let g:airline_powerline_fonts=1

" Always show statusline
set laststatus=2


" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Tema
colorscheme monokai
let g:airline_theme='powerlineish'


