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

" ------------------------------------------------
" keymaps
" ------------------------------------------------
" toggle search highlight
nnoremap <leader>h :set hlsearch! hlsearch?<cr>

" save
nnoremap <leader>w :w<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Tab-completion down subfolders
set path+=**
set wildmenu

" Setup netrw
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_altv=1

" Vimwiki Settings
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': 'md'}]
" let g:vimwiki_global_ext = 0

" Plugins
call plug#begin()

Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'sainnhe/everforest'
Plug 'tpope/vim-commentary'
Plug 'vimwiki/vimwiki'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }

call plug#end()


lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = { enable = true },
  -- ensure_installed = { "c", "lua", "python", "vim" },
  auto_install = true,
}
EOF

colorscheme everforest
