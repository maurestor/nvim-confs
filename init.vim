" init.vim: Archivo de configuración principal para Neovim

" Configuración de Pathogen para gestionar plugins
"execute pathogen#infect()
"execute pathogen#helptags()

" Configuración de vim-plug para gestionar plugins
call plug#begin('~/.local/share/nvim/plugged')

" Lista de plugins
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'github/copilot.vim'
Plug 'wakatime/vim-wakatime'
Plug 'valloric/youcompleteme'
Plug 'tpope/vim-fugitive'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'olimorris/onedarkpro.nvim'

" Finalizar la configuración de vim-plug
call plug#end()

" Activar la sintaxis
syntax on
syntax enable

" Activar el soporte de tipo de archivo y auto-indentación
filetype plugin indent on

" Configuración básica de Vim
set encoding=utf-8       " Usar codificación UTF-8
set wrap                 " Permitir el ajuste de línea
set linebreak            " Rompe líneas en palabras completas en lugar de a mitad de palabra
set showbreak=+++        " Muestra '+++' al inicio de las líneas envueltas para indicar continuidad
set showmatch            " Mostrar corchetes coincidentes
set mouse=a              " Habilitar el uso del ratón en todas las modalidades
set number               " Mostrar números de línea

" Configuración de Airline
let g:airline#extensions#tabline#enabled = 1          " Habilitar la extensión tabline de Airline
let g:airline#extensions#tabline#show_buffers = 1     " Mostrar buffers en la tabline
let g:airline#extensions#tabline#show_tabs = 1        " Mostrar tabs en la tabline
let g:airline_powerline_fonts = 1                     " Usar fuentes Powerline en Airline

" Mostrar siempre la línea de estado
set laststatus=2

" Configuración de sangría y tabulación
set expandtab           " Use spaces instead of tabs
set tabstop=4          " Number of spaces for a tab
set shiftwidth=4       " Number of spaces for autoindent
set softtabstop=4      " Number of spaces for soft tab
set autoindent         " Copy indent from current line when starting a new line
set smartindent        " Smart autoindenting when starting a new line

" Terminal mode settings Pegado right click
tnoremap <RightMouse> <C-\><C-N>"*p

" Configuración del tema
set termguicolors
colorscheme onedark      " Usar el esquema de colores Monokai
let g:airline_theme='powerlineish'  " Usar el tema 'powerlineish' para Airline

" Habilitar GitHub Copilot automáticamente al iniciar Neovim
autocmd VimEnter * Copilot enable

" Configuración adicional para una mejor experiencia de edición
set clipboard=unnamedplus   " Usar el portapapeles del sistema para operaciones de copiar/pegar
set cursorline              " Resaltar la línea actual

" confgiguracion de Youcompleteme desactivarlo

" Configuración de nvim-treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "cpp", "python", "javascript", "lua", "html", "css", "bash" }, -- Lista de lenguajes a instalar
  highlight = {
    enable = true,              -- Habilitar la característica de resaltado de nvim-treesitter
    additional_vim_regex_highlighting = false, -- Deshabilitar el resaltado de sintaxis de Vim

  },
}
EOF

" Configuración para que YouCompleteMe y GitHub Copilot trabajen juntos
" Redefinir la tecla Tab para que primero intente aceptar la sugerencia de Copilot y luego YCM

" Función para manejar la tecla Tab
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Mapeos para la tecla Tab
inoremap <silent><expr> <Tab> copilot#Accept("\<Tab>")
inoremap <silent><expr> <C-Space> pumvisible() ? "\<C-n>" : "\<C-Space>"
inoremap <silent><expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <silent><expr> <C-e> pumvisible() ? "\<C-e>" : "\<C-e>"

" Configuración de YouCompleteMe
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'


