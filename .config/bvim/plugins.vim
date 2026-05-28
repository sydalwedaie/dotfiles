call plug#begin()

" LSP and Completion
Plug 'mason-org/mason.nvim'
Plug 'mason-org/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'saghen/blink.cmp', { 'tag': 'v1.*' }
Plug 'rafamadriz/friendly-snippets'

" Editing Tools
Plug 'tpope/vim-commentary'
Plug 'windwp/nvim-autopairs'
Plug 'tpope/vim-surround'

" Themes/Styles
Plug 'sainnhe/everforest'
 "Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate' }
Plug 'nvim-tree/nvim-web-devicons'
Plug 'hiphish/rainbow-delimiters.nvim'
Plug 'brenoprata10/nvim-highlight-colors' 
Plug 'nvim-mini/mini.statusline', { 'branch': 'stable' }
Plug 'nvim-lualine/lualine.nvim'

" Utilities
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'itchyny/vim-gitbranch'
Plug 'junegunn/goyo.vim'
Plug 'nvim-mini/mini.files'
Plug 'vimwiki/vimwiki'
Plug 'nvim-lua/plenary.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }

call plug#end()
