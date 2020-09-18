let g:vimtex_view_method = 'zathura'
let g:vimtex_text_obj_enabled=0
let g:vimtex_compiler_latexmk = {'build_dir' : '/tmp'}
packadd! vimtex
call vimtex#init()

imap <C-j> <Plug>(coc-snippets-expand-jump)

setlocal spelllang=pt-br spell tw=79 cc=80
