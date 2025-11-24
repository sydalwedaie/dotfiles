noremap <Leader>g :Goyo<CR>

function! s:goyo_enter()
  set textwidth=80

  " Make j/k move in logical lines
  nnoremap j gj
  nnoremap k gk
  " Limelight                                           
endfunction

function! s:goyo_leave()                              
  set textwidth=0

  " Reset j/k behavior
  unmap j
  unmap k
  " Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter() 
autocmd! User GoyoLeave nested call <SID>goyo_leave()

noremap <Leader>s :set spell! spelllang=en_gb<CR>     

