if has('termguicolors')
  set termguicolors
endif

let mapleader=' '

" tabs and indentation
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent

" line wrapping
set wrap

" search setting
set ignorecase
set smartcase

" cursor line
set cursorline 

" theme settings
syntax on
set background=dark
let g:everforest_better_performance = 1

" line numbers
set number
set relativenumber
set ffs=unix,dos
set ff=unix

" enable extra features
set nocompatible

" enable plugins
filetype plugin on

" other
set mouse+=a

" auto pair
inoremap ` ``<left>
inoremap ' ''<left>
inoremap " ""<left>
inoremap { {}<left>
inoremap [ []<left>
inoremap ( ()<left>

" toggle search highlight
nnoremap <leader>h :set hlsearch! hlsearch?<cr>

" comment out
nnoremap <leader>/ I// <esc>

" surround
nnoremap <leader>` diWi``<esc>p
nnoremap <leader>' diWi''<esc>p
nnoremap <leader>" diWi""<esc>p
nnoremap <leader>{ diWi{}<esc>p
nnoremap <leader>[ diWi[]<esc>p
nnoremap <leader>( diWi()<esc>p

packadd! everforest
colorscheme everforest

" Use a line cursor within insert mode and a block cursor everywhere else.
" "
" " Reference chart of values:
" "   Ps = 0  -> blinking block.
" "   Ps = 1  -> blinking block (default).
" "   Ps = 2  -> steady block.
" "   Ps = 3  -> blinking underline.
" "   Ps = 4  -> steady underline.
" "   Ps = 5  -> blinking bar (xterm).
" "   Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Tab-completion down subfolders
set path+=**
set wildmenu

" Setup netrw
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_altv=1
