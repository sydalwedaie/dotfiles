" toggle search highlight
nnoremap <leader>h :set hlsearch! hlsearch?<cr>

" save
nnoremap <leader>w :w<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" vim-like terminal window management
tnoremap <C-w> <C-\><C-n><C-w>

