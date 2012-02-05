syntax on
filetype plugin indent on
colorscheme desert

set nocompatible

set autoindent
set smartindent
set textwidth=80
set tabstop=2
set expandtab
set softtabstop=2
set shiftwidth=2
set shiftround

set nobackup
set nowritebackup
set noswapfile

set ruler
set title
set backspace=indent,eol,start
set history=1000
set showcmd
set incsearch

set tagstack
set tags=tags

set encoding=utf-8
set fileencoding=utf-8

set foldmethod=indent
set foldnestmax=10
set foldlevel=1

""""""""

let mapleader = ","

map <silent> .# :s/^\(\s*\)/\1\# /<CR> :nohlsearch<CR>
map <silent> .? :s/^\(\s*\)\# /\1/<CR> :nohlsearch<CR>

" Ctrl-C > copy to clip
vmap <C-c> y: call system("xclip -i -selection clipboard", getreg("\""))<CR>

function! StripWhitespace ()
  exec ':%s/ \+$//gc'
endfunction
map ,s :call StripWhitespace ()<CR>

""""""""

let g:tagbar_foldlevel = 1
let g:proj_window_width = 30
