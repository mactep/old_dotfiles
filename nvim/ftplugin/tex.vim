setlocal spelllang=pt-br spell tw=79 cc=80
packadd! vim-snippets
let g:coc_global_extensions = ['coc-vimtex', 'coc-snippets']

let g:vimtex_view_method = 'zathura'
packadd! vimtex
call vimtex#init()

function! CloseViewers()
  if executable('xdotool') && exists('b:vimtex')
      \ && exists('b:vimtex.viewer') && b:vimtex.viewer.xwin_id > 0
    call system('xdotool windowclose '. b:vimtex.viewer.xwin_id)
  endif
endfunction

augroup vimtex
  au!
  au User VimtexEventQuit call CloseViewers()
  au User VimtexEventQuit call vimtex#compiler#clean(0)
  au User VimtexEventQuit execute '!rm '.expand('%:r').'.synctex.gz'
augroup END
