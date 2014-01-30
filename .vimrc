" options for gui
if has('gui_running')
  set guifont=Mono
  set guioptions-=T " no toolbar
endif

" Vundle calls
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


"" Bundles

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/syntastic'
Bundle 'wincent/Command-T'
Bundle 'L9'
Bundle 'eagletmt/ghcmod-vim'
Bundle 'Shougo/vimproc'


" Indenting, formatting
set tabstop=2
set softtabstop=2
set shiftwidth=2
set cinkeys=0{,0},:,0#,!^F
set smarttab
set smartindent
set expandtab
set autoindent

" No-brainter options
syntax on 
filetype plugin indent on
set nocompatible
set number

" folding settings
set foldmethod=indent "fold based on indent
set foldnestmax=10    "deepest fold is 10 levels 
set nofoldenable      "don't fold by default 
set foldlevel=1       "this is just what i use 

" Wildmenu autocompleting coolness
set wildmenu

"" Mappings

" Leader key is comma
let mapleader = ","
nnoremap <silent><leader>ev :e ~/.vimrc<CR>
nnoremap <silent><leader>zM :fold<CR>
nnoremap <silent><leader>zR :foldopen<CR>
noremap <ESC>[5~ <C-U>


" Useful mapping
vnoremap <leader>" <esc>`<i"<esc>`>la"<esc>
nnoremap H 0
nnoremap L $
inoremap jk <esc>

highlight OverLength ctermbg=darkred ctermfg=white guibg=#
match OverLength /\%81v.\+/

if !exists("autocommands_loaded")
  let autocommands_loaded = 1

  " auto updating of vimrc
  autocmd bufwritepost .vimrc source ~/.vimrc

  " Filetype mappings
  augroup filetype_perl
    autocmd!
    autocmd FileType perl nnoremap <buffer> <leader>c I#<esc>
  augroup END

  augroup filetype_python
    autocmd!
    autocmd FileType python nnoremap <buffer> <leader>c I#<esc>
    autocmd FileType python     :iabbrev <buffer> iff if:<left>
  augroup END

  augroup filetype_javascript
    autocmd!
    autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
    autocmd Filetype javascript :iabbrev <buffer> iff if()<left><esc>xi
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  augroup END

  augroup filetype_cpp
    autocmd!
    autocmd Filetype cpp setlocal omnifunc=cppcomplete#CompleteCPP
    autocmd Filetype cpp nnoremap <leader>dt :Dispatch make && make run <CR>
    autocmd Filetype cpp setlocal tabstop=4
    autocmd Filetype cpp setlocal softtabstop=4
    autocmd Filetype cpp setlocal shiftwidth=4
  augroup END

  " Highlighing
  augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
    set cursorline cursorcolumn
  augroup END
endif


"" Status Line

set statusline=%f\ -\ FileType:\ %y

"" Colors
if has('gui_running')
  colorscheme wombat
  set background=dark
else
  set background=dark
  colorscheme wombat256mod
endif


"" Interface / Highlighting

" Keep  a minimum of 7 lines above and below the cursor when possible
let &scrolloff=7-&scrolloff

" When a bracket is inserted, briefly jump to the matching one
set showmatch

" Highlight redudant whitespaces
highlight RedundantSpaces ctermbg=gray guibg=gray
match RedundantSpaces /\s+$| +\ze\t/

"" Command / Key Behavior

" Allow backspacing over autoindent, line breaks, start of insert
set backspace=indent,eol,start

" Allow  arrow keys to wrap at eol
set whichwrap=<,>


command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  let isfirst = 1
  let words = []
  for word in split(a:cmdline)
    if isfirst
      let isfirst = 0 " don't change first word (shell command)
    else
      if word[0] =~ '\v[%#<]'
        let word = expand(word)
      endif
      let word = shellescape(word, 1)
    endif
    call add(words, word)
  endfor
  let expanded_cmdline = join(words)
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered: ' . a:cmdline)
  call setline(2, 'Expanded to ' . expanded_cmdline)
  call append(line('$'), substitute(getline(2), '.', '=', 'g'))
  silent execute '$read !' . expanded_cmdline
  1
endfunction


" Syntastic options
let g:syntastic_python_flake8_args='--ignore=E111,E121'
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11'
