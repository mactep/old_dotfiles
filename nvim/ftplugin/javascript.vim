let g:coc_global_extensions = ['coc-tsserver', 'coc-snippets']
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nnoremap <buffer><silent>K :call CocAction('doHover')<cr>
imap <C-j> <Plug>(coc-snippets-expand-jump)
