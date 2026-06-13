local vim = vim
local Plug = vim.fn["plug#"]

vim.call("plug#begin")

-- LSP and Completion
Plug("mason-org/mason.nvim")
Plug("mason-org/mason-lspconfig.nvim")
Plug("neovim/nvim-lspconfig")
Plug("WhoIsSethDaniel/mason-tool-installer.nvim")
Plug("saghen/blink.cmp", { ["tag"] = "v1.*" })
Plug("rafamadriz/friendly-snippets")
Plug("L3MON4D3/LuaSnip", { ["tag"] = "v2.*", ["do"] = "make install_jsregexp" })

-- Editing Tools
Plug("tpope/vim-commentary")
Plug("windwp/nvim-autopairs")
Plug("tpope/vim-surround")
Plug("windwp/nvim-ts-autotag")

-- Themes/Styles
Plug("sainnhe/everforest")
Plug("ember-theme/nvim")
Plug("nvim-tree/nvim-web-devicons")
Plug("hiphish/rainbow-delimiters.nvim")
Plug("brenoprata10/nvim-highlight-colors")

-- Utilities
Plug("nvim-lua/plenary.nvim")
Plug("nvim-telescope/telescope.nvim", { ["branch"] = "master" })
Plug("nvim-treesitter/nvim-treesitter", { ["branch"] = "main", ["do"] = ":TSUpdate" })
Plug("stevearc/conform.nvim")
Plug("nvim-lualine/lualine.nvim")
Plug("nvim-mini/mini.files")
Plug("iamcco/markdown-preview.nvim", { ["do"] = "cd app && npx --yes yarn install" })
Plug("SmiteshP/nvim-navic")

vim.call("plug#end")
