source $HOME/.config/avim/plugins.vim
source $HOME/.config/avim/settings.vim
source $HOME/.config/avim/keymaps.vim
" source $HOME/.config/avim/config-lsp.vim
source $HOME/.config/avim/config-lsp.lua
source $HOME/.config/avim/config-telescope.lua
source $HOME/.config/avim/goyo.vim

" Vimwiki Settings
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': 'md'}]
" let g:vimwiki_global_ext = 0

" treesitter settings
lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = { enable = true },
  auto_install = true,
}
EOF

" Nvim Highlight Settings
lua << EOF
require("nvim-highlight-colors").setup {
	render = 'virtual',
}
EOF

