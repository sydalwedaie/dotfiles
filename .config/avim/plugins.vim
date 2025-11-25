call plug#begin()

Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'sainnhe/everforest'

" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'mason-org/mason.nvim'
Plug 'mason-org/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'

Plug 'tpope/vim-commentary'
Plug 'vimwiki/vimwiki'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }

Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'brenoprata10/nvim-highlight-colors' 

Plug 'junegunn/goyo.vim'

Plug 'nvim-tree/nvim-web-devicons'

call plug#end()
