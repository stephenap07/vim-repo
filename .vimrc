" options for gui
if has('gui_running')
  set guifont=Mono
  set guioptions-=T " no toolbar
endif

" Pathogen calls
call pathogen#infect()

" Indenting, formatting
set tabstop=2
set softtabstop=2
set shiftwidth=2
set cinkeys=0{,0},:,0#,!,!^F
set smarttab
set smartindent
set expandtab
set autoindent

" No-brainter options
syntax on 
filetype plugin on
set nocompatible
set number
set hlsearch
:noremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Auto-correct
:ab teh the
:ab fro for 

" Wildmenu autocompleting coolness
set wildmenu

" Leader key is comma
let mapleader = ","

" folding settings
set foldmethod=indent "fold based on indent
set foldnestmax=10    "deepest fold is 10 levels 
set nofoldenable      "don't fold by default 
set foldlevel=1       "this is just what i use 

nmap <silent><leader>zM :fold<CR>
nmap <silent><leader>zR :foldopen<CR>
" map vimrc
nmap <silent><leader>ev :e ~/.vimrc<CR>

" map nerdtree
nnoremap <silent><leader>nt :NERDTreeToggle<CR>

" auto updating of vimrc
if has("autocmd")  
  autocmd bufwritepost .vimrc source ~/.vimrc
endif

" Colors
if has('gui_running')
  colorscheme wombat
  set background=dark
  else
    set background=dark
    set t_Co=256
    colorscheme wombat256mod
endif

" reload 
command! -bar Cr silent ChromeReload


" Show numbers to the side
" set number

" Interface / Highlighting

"" Keep  a minimum of 7 lines above and below the cursor when possible
let &scrolloff=7-&scrolloff

"" Display Character Hex Value in Ruler
set rulerformat=%15(%c,%l\ \\\x%B%)

"" When a bracket is inserted, briefly jump to the matching one
set showmatch

"" Highlight redudant whitespaces
highlight RedundantSpaces ctermbg=gray guibg=gray
match RedundantSpaces /\s+$| +\ze\t/

" Command / Key Behavior

"" Allow backspacing over autoindent, line breaks, start of insert
set backspace=indent,eol,start

"" Allow  arrow keys to wrap at eol
set whichwrap=<,>

"" Make # comment out current line in command mode
" this is perl specific
map # 0i#<ESC>j

"" Allow page up/down to move position when less than full page is available
map <ESC>[5~ <C-U>

au BufRead,BufNewFile *.confl set filetype=confluence
au! Syntax confluence source ~/.vim/confluencewiki.vim 
"" Omnicomplete settings
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

