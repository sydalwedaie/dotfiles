" if exists('+termguicolors')
"  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"  set termguicolors
"endif
if has('termguicolors')
  set termguicolors
endif

let mapleader=' '

" Inbox
set splitbelow
set breakindent
set showcmd

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
let g:lightline = { 'colorscheme': 'everforest'}

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

colorscheme everforest

" Use a line cursor within insert mode and a block cursor everywhere else.
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

call plug#begin()

" List your plugins here
Plug 'tpope/vim-sensible'
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'sainnhe/everforest'

call plug#end()

