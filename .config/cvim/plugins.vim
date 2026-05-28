call plug#begin()

" LSP and Completion
Plug 'mason-org/mason.nvim'
Plug 'mason-org/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'

Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'

" Editing Tools
Plug 'tpope/vim-commentary'
Plug 'windwp/nvim-autopairs'
Plug 'tpope/vim-surround'

" Themes/Styles
Plug 'sainnhe/everforest'
Plug 'ember-theme/nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'branch': 'main', 'do': ':TSUpdate' }
Plug 'nvim-tree/nvim-web-devicons'
Plug 'hiphish/rainbow-delimiters.nvim'
Plug 'brenoprata10/nvim-highlight-colors' 

" Utilities
Plug 'nvim-telescope/telescope.nvim', {'branch': 'master'}
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'nvim-lualine/lualine.nvim'
Plug 'junegunn/goyo.vim'
Plug 'nvim-mini/mini.files'
Plug 'vimwiki/vimwiki'
Plug 'nvim-lua/plenary.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
Plug 'stevearc/conform.nvim'
Plug 'emmanueltouzery/apidocs.nvim'

call plug#end()
