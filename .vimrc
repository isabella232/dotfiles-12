syntax on
filetype plugin indent on
colorscheme desert

set autoindent
set nocompatible
set nobackup
set ruler
set title
set backspace=indent,eol,start
set history=1000
set showcmd
set incsearch
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab
"set mouse=a
set tagstack
set tags=tags
set encoding=utf-8
set fileencoding=utf-8
set foldmethod=indent
set foldnestmax=10
set foldenable
set foldlevel=1

map <silent> <F8> :TlistToggle<CR>

map <silent> ./ :s/^\(\s*\)/\1\/\//<CR> :nohlsearch<CR>
map <silent> .? :s/^\(\s*\)\/\//\1/<CR> :nohlsearch<CR>

map <silent> .# :s/^\(\s*\)/\1\# /<CR> :nohlsearch<CR>
map <silent> ..? :s/^\(\s*\)\# /\1/<CR> :nohlsearch<CR>

map <silent> <C-=> <Esc><C-]>

" Ctrl-C > copy to clip
vmap <C-c> y: call system("xclip -i -selection clipboard", getreg("\""))<CR>


let g:tagbar_foldlevel = 1
let g:proj_window_width = 30
