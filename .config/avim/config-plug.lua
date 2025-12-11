-- Treesitter settings
require'nvim-treesitter.configs'.setup {
  highlight = { 
    enable = true,
    disable = { "tmux" },
  },
  auto_install = true,
}

-- Nvim Highlight Settings
require("nvim-highlight-colors").setup {
	render = 'virtual',
}

-- Mini.files settings
require('mini.files').setup({
  mappings =  {
    reveal_cwd  = '@',
  },

  options = {
    permanent_delete = true,
  },

  windows = {
    preview = true,
  }
})

-- LSP
vim.diagnostic.config({ virtual_text = true })
require("mason").setup()
require("mason-lspconfig").setup()

local cmp = require('cmp')

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = 'nvim_lsp' },
  }
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Telescope
require('telescope').setup {
  pickers = {
    find_files = {
      find_command = { 
        "rg", 
        "--files", 
        "--hidden",           -- Show dotfiles
        "--glob", "!**/.git/*"   -- But exclude .git directory
      },
      -- rg respects .gitignore by default
    },
  },
}

-- Rainbow Delimiters
vim.g.rainbow_delimiters = {
    highlight = {
        'yellow',
        'RainbowDelimiterRed',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
    },
}

-- Vim git branch
vim.g.lightline = {
  colorscheme = "everforest",
  active = {
    left = {
      { 'mode', 'paste' },
      { 'giticon', 'gitbranch', 'readonly', 'filename', 'modified' },
    },
  },
  component_function = {
    gitbranch = 'gitbranch#name',
  },
}

