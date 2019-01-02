set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
noremap <leader>sr :SyntasticReset<CR>
noremap <leader>sc :SyntasticCheck<CR>
noremap <leader>st :SyntasticToggleMode<CR>
