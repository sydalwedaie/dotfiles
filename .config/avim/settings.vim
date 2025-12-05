if has('termguicolors')
  set termguicolors
endif

let mapleader=' '

" Inbox
set splitbelow
set splitright
set breakindent
set showcmd
set signcolumn=yes
set updatetime=300
set linebreak
set showbreak=↪
set pumheight=10
set scrolloff=1

" Fixing leader w delay
set timeout
set timeoutlen=300  " Balance speed vs multi-key support; try 300-1000
set ttimeoutlen=50  " Fast keycode timeout (ESC sequences)

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
let g:everforest_background = 'hard'
let g:everforest_transparent_background=0

colorscheme everforest

hi! @punctuation.bracket gui=bold cterm=bold " Make brackets bold

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
set noshowmode

" Tab-completion down subfolders
set path+=**
set wildmenu

" Setup netrw
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_altv=1

" FileType setting
augroup mytabs
  autocmd!
  autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
  autocmd FileType go setlocal tabstop=4 shiftwidth=4 noexpandtab
  autocmd FileType c setlocal tabstop=4 shiftwidth=4 noexpandtab
augroup END

