setlocal cc=100 scl=yes
setlocal foldmethod=indent foldlevel=1 foldnestmax=2 foldignore-=#

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nnoremap <buffer><silent>K :call CocAction('doHover')<cr>
