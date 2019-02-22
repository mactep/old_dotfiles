" autocomplete
set completeopt=longest,menuone,noinsert,noselect
set pumheight=12

" deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option({
            \ 'smart_case': v:true,
            \ 'min_pattern_length': 1,
            \ })

" LanguageClient
let g:LanguageClient_serverCommands = {
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['pyls'],
    \ }

" neosnippet (keep an eye on deoppet)
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-d>"
" Fix for jumping over placeholders for neosnippet
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)" : "\<TAB>"
" comment this out if experiencing some bug
if has('conceal')
    set conceallevel=2 concealcursor=niv
endif

"inoremap <expr><Tab>   pumvisible() ? '\<C-n>' : '\<Tab>'
"inoremap <expr><S-Tab> pumvisible() ? '\<C-p>' : '\<C-d>'
"inoremap <expr><CR>    pumvisible() ? '\<C-e>' : '\<CR>'

"" ultisnips graveyard
"inoremap <silent><expr><TAB> pumvisible() ? '\<C-y>' : IsExpandable() ? '\<C-r>=UltiSnips#ExpandSnippetOrJump()\<CR>' : ''
"inoremap <silent><expr><S-Tab> IsExpandable() ? '\<C-r>=UltiSnips#JumpBackwards()\<CR>' : '\<C-d>'
"inoremap <expr><TAB> IsExpandable() ? '\<C-r>=UltiSnips#ExpandSnippetOrJump()\<CR>' : pumvisible() ? '\<C-y>' : '\<TAB>'
"function IsExpandable()
"    return !(
"        \ col('.') <= 1
"        \ || !empty(matchstr(getline('.'), '\%' . (col('.') - 1) . 'c\s'))
"        \ || empty(UltiSnips#SnippetsInCurrentScope())
"        \ )
"endfunction
