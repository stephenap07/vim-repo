" options for gui
if has('gui_running')
  set guifont=Mono
  set guioptions-=T " no toolbar
endif

" Pathogen calls
call pathogen#infect()

" Some simple properties
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set smartindent
set expandtab
set autoindent

" No-brainter options
syntax on 
filetype plugin on
set nocompatible
set number

set wildmenu

" Leader key is comma
let mapleader = ","

" map vimrc
nmap <silent><leader>ev :e ~/.vimrc<CR>

" auto updating of vimrc
if has("autocmd")  
  autocmd bufwritepost .vimrc source ~/.vimrc
endif

" Colors
if has('gui_running')
  colorscheme solarized
  set background=dark
  else
    set t_Co=256
    set background=dark
    colorscheme solarized
endif
