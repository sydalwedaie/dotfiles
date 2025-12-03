" Vimwiki Settings
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': 'md'}]
let g:vimwiki_global_ext = 0
let g:vimwiki_diary_frequency = 'weekly'
let g:vimwiki_diary_start_week_day = 'saturday'

" Goyo Settings
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
  hi! @punctuation.bracket gui=bold cterm=bold "Must reaply after exit!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter() 
autocmd! User GoyoLeave nested call <SID>goyo_leave()


