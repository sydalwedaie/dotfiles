call plug#begin()

" LSP and Completion
Plug 'mason-org/mason.nvim'
Plug 'mason-org/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'

" Editing Tools
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

" Themes/Styles
Plug 'sainnhe/everforest'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-tree/nvim-web-devicons'
Plug 'hiphish/rainbow-delimiters.nvim'
Plug 'brenoprata10/nvim-highlight-colors' 
Plug 'MeanderingProgrammer/render-markdown.nvim'

" Utilities
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim'
Plug 'nvim-mini/mini.files'
Plug 'vimwiki/vimwiki'

" Other
Plug 'nvim-lua/plenary.nvim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()
