-- Treesitter settings
-- require'nvim-treesitter.configs'.setup {
--   ensure_installed = {
--     "javascript",
--     "typescript",
--     "html",
--     "tsx",
--     "query",
--   },
--   highlight = { 
--     enable = true,
--     disable = { "tmux" },
--   },
--   auto_install = true,
-- }

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

require('blink.cmp').setup({
  keymap = { preset = 'default' },
  appearance = {
    nerd_font_variant = 'mono'
  },
  completion = {
    documentation = { auto_show = false }
  },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
  fuzzy = {
    implementation = "prefer_rust_with_warning"
  }
})

-- Get html auto-comp in template literals
vim.lsp.config('emmet_language_server', {
  filetypes = { "html", "css", "javascript", "javascriptreact", "typescriptreact", "vue", "svelte" },
})


-- Telescope
require('telescope').setup {
  defaults = {
    preview = {
      treesitter = false, -- This disables treesitter in the preview window
    },
  },
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

vim.keymap.set('n', '<leader>ft', function()
  require('telescope.builtin').buffers({
    prompt_title = "Terminal Buffers",
    default_text = "term://",
  })
end, { desc = "Telescope Terminal Buffers" })

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

-- Lightline
-- vim.g.lightline = {
--   colorscheme = "everforest",
--   active = {
--     left = {
--       { 'mode', 'paste' },
--       { 'giticon', 'gitbranch', 'readonly', 'filename', 'modified' },
--     },
--   },
--   component_function = {
--     gitbranch = 'gitbranch#name',
--   },
-- }

-- Mini Statusline
-- require('mini.statusline').setup()
require('lualine').setup {
  options = {
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
  },
  sections = {
    lualine_c = {
      {
        'filename',
        path = 1,
      }
    },
    lualine_x = {
      {
        'filetype',
        icon_only = true,
      }
    }
  }
}

-- Autopair
require("nvim-autopairs").setup {}

