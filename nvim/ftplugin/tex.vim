setlocal spelllang=pt-br spell tw=79 cc=80

let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_latexmk = {'build_dir' : '/tmp'}
packadd! vimtex
call vimtex#init()

let g:coc_global_extensions = ['coc-vimtex', 'coc-snippets']
imap <C-j> <Plug>(coc-snippets-expand-jump)
