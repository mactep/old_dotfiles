"netrw
"let g:netrw_sort_by        = 'time'
"let g:netrw_sort_direction = 'reverse'
"let g:netrw_banner         = 0
"let g:netrw_liststyle      = 3
"let g:netrw_browse_split   = 3
"let g:netrw_fastbrowse     = 1
"let g:netrw_sort_by        = 'name'
"let g:netrw_sort_direction = 'normal'
"let g:netrw_winsize=20
"nnoremap <silent><c-n> :Lexplore<cr>

nmap <silent><C-N> :Defx -split=vertical -winwidth=35
    \ -direction=topleft -toggle `expand('%:p:h')`
    \ -columns=git:mark:filename:type -search=`expand('%:p')`<cr>

let g:defx_git#indicators = {
    \ 'Modified'  : '*',
    \ 'Staged'    : '+',
    \ 'Untracked' : 'u',
    \ 'Renamed'   : '-',
    \ 'Unmerged'  : '=',
    \ 'Ignored'   : 'i',
    \ 'Deleted'   : 'x',
    \ 'Unknown'   : '?'
    \ }

aug defx_close
    au!
    au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "defx"|q|endif
aug END

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
    " Define mappings
    nnoremap <silent><buffer><expr> <CR> defx#do_action('open', 'wincmd w \| drop')
    nnoremap <silent><buffer><expr> h defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> l defx#do_action('open', 'wincmd w \| drop')
    nnoremap <silent><buffer><expr> H defx#do_action('cd', [getcwd()])
    nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> q defx#do_action('quit')
    nnoremap <silent><buffer><expr> E defx#do_action('open', 'vsplit')
    nnoremap <silent><buffer><expr> P defx#do_action('open', 'pedit')
    nnoremap <silent><buffer><expr> K defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N defx#do_action('new_file')
    nnoremap <silent><buffer><expr> d defx#do_action('remove')
    nnoremap <silent><buffer><expr> r defx#do_action('rename')
    nnoremap <silent><buffer><expr> c defx#do_action('copy')
    nnoremap <silent><buffer><expr> m defx#do_action('move')
    nnoremap <silent><buffer><expr> p defx#do_action('paste')
    nnoremap <silent><buffer><expr> x defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> <Space> \ defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> * defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> <leader>l defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <leader>g defx#do_action('print')
endfunction
