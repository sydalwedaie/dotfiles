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
set pumheight=10
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
colorscheme everforest

let g:lightline = { 'colorscheme': 'everforest'}
let g:rainbow_active = 1 " set to 0 if you want to enable it later via :RainbowToggle

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

" toggle fzf.vim
nnoremap <leader>sf :Files<Cr>
nnoremap <leader>sb :Buffers<Cr>


" surround
nnoremap <leader>` diWi``<esc>p
nnoremap <leader>' diWi''<esc>p
nnoremap <leader>" diWi""<esc>p
nnoremap <leader>{ diWi{}<esc>p
nnoremap <leader>[ diWi[]<esc>p
nnoremap <leader>( diWi()<esc>p

" save
nnoremap <leader>w :w<CR>

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

" LSP Settings

let g:lsp_document_code_action_signs_enabled = 0 " disable A> sign
let g:lsp_diagnostics_enabled = 0         

augroup lsp_setup
  autocmd!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


augroup lsp_autoformat
  autocmd!
  autocmd BufWritePre * :LspDocumentFormatSync
augroup END

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> K <plug>(lsp-hover)
  nmap <buffer> <leader>rn <plug>(lsp-rename)
  nmap <buffer> [g <plug>(lsp-previous-diagnostic)
  nmap <buffer> ]g <plug>(lsp-next-diagnostic)
endfunction

" Yank Highlight Settings
let g:highlightedyank_highlight_duration = 200
highlight HighlightedyankRegion ctermfg=DarkYellow ctermbg=Black

" Vimwiki Settings
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': 'md'}]
" let g:vimwiki_global_ext = 0

" Plugins
call plug#begin()

" List your plugins here
Plug 'tpope/vim-sensible'
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'sainnhe/everforest'
Plug 'luochen1990/rainbow'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'tpope/vim-commentary'
Plug 'machakann/vim-highlightedyank'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vimwiki/vimwiki'
" Plug 'dense-analysis/ale'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()


augroup mytabs
  autocmd!
  autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
  autocmd FileType go setlocal tabstop=4 shiftwidth=4 noexpandtab
  autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 expandtab
  autocmd FileType c setlocal tabstop=4 shiftwidth=4 noexpandtab
augroup END
