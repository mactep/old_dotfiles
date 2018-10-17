if &compatible
    set nocompatible
endif

" Required:
set runtimepath+=$HOME/.config/nvim/./repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('$HOME/.config/nvim/')
    call dein#begin('$HOME/.config/nvim/')

    " Required:
    call dein#add('$HOME/.config/nvim/./repos/github.com/Shougo/dein.vim')

    call dein#add('vim-airline/vim-airline')
    call dein#add('morhetz/gruvbox')
    call dein#add('Shougo/defx.nvim')
    call dein#add('airblade/vim-gitgutter')
    "call dein#add('itchyny/lightline.vim')
    "call dein#add('scrooloose/nerdtree')
    "call dein#add('jistr/vim-nerdtree-tabs')
    "call dein#add('Xuyuanp/nerdtree-git-plugin')

    call dein#add('scrooloose/nerdcommenter')
    call dein#add('Raimondi/delimitMate')
    call dein#add('scrooloose/syntastic')
    call dein#add('chrisbra/Colorizer')
    call dein#add('ludovicchabant/vim-gutentags')

    call dein#add('vim-python/python-syntax')
    call dein#add('pangloss/vim-javascript')
    call dein#add('MaxMEllon/vim-jsx-pretty')
    call dein#add('lervag/vimtex')

    call dein#add('Shougo/deoplete.nvim')
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('zchee/deoplete-jedi')
    call dein#add('wokalski/autocomplete-flow')
    call dein#add('zchee/deoplete-clang')
    "call dein#add('carlitux/deoplete-ternjs')
    "call dein#add('ternjs/tern_for_vim')

    " Required:
    call dein#end()
    call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

if dein#check_install()
    call dein#install()
endif

" color settings
set termguicolors
let g:gruvbox_contrast_dark='hard'
set background=dark
colorscheme gruvbox

" general settings
set number
set list
set listchars=eol:¬,tab:..,trail:.
set clipboard=unnamed 			" paste from system clipboard
set splitbelow
set splitright
set inccommand=nosplit			" makes the output of some commands show up as you type
set autochdir
set undofile
set directory=~/.config/nvim/swap//
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

" shortcuts
let mapleader = ','

inoremap <S-Tab> <C-d>
nnoremap <S-Tab> <<
nnoremap <Tab> >>
vnoremap <S-Tab> <gv
vnoremap <Tab> >gv

nnoremap <Home> ^

nnoremap <C-s> :w<CR>
vnoremap <C-s> <C-C>:w<CR>
inoremap <C-s> <C-O>:w<CR>

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nnoremap <esc> :noh<return><esc>

tnoremap <Esc> <C-\><C-n>
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-l> <C-\><C-n><C-w>l
nnoremap <leader>t :call Term_toggle(10)<cr>
tnoremap <leader>t <C-\><C-n>:call Term_toggle(10)<cr>

noremap <leader>dt :diffthis<CR>
noremap <leader>dg :diffget<CR>
noremap <leader>dp :diffput<CR>
noremap <leader>do :diffoff<CR>

nmap <leader>bn :enew<CR>
nmap <leader>bl :bnext<CR>
nmap <leader>bh :bprevious<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
"nmap <leader>bl :ls<CR>

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" delimitMate settings
let delimitMate_jump_expansion = 0
let delimitMate_expand_cr = 1

" gutentags
let g:gutentags_cache_dir = "~/.config/nvim/cache/"

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
noremap <leader>sr :SyntasticReset<CR>
noremap <leader>sc :SyntasticCheck<CR>

" dex settings
nmap <silent><C-N> :Defx -split=vertical -winwidth=35 -direction=topleft -toggle `expand('%:p:h')` -search=`expand('%:p')`<cr>
aug defx_close
    au!
    au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "defx"|q|endif
aug END

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
    " Define mappings
    nnoremap <silent><buffer><expr> <CR>
    \ defx#do_action('open', 'wincmd w \| drop')
    nnoremap <silent><buffer><expr> E
    \ defx#do_action('open', 'vsplit')
    nnoremap <silent><buffer><expr> P
    \ defx#do_action('open', 'pedit')
    nnoremap <silent><buffer><expr> K
    \ defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N
    \ defx#do_action('new_file')
    nnoremap <silent><buffer><expr> d
    \ defx#do_action('remove')
    nnoremap <silent><buffer><expr> r
    \ defx#do_action('rename')
    nnoremap <silent><buffer><expr> h
    \ defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> l
    \ defx#do_action('open')
    nnoremap <silent><buffer><expr> c
    \ defx#do_action('copy')
    nnoremap <silent><buffer><expr> m
    \ defx#do_action('move')
    nnoremap <silent><buffer><expr> p
    \ defx#do_action('paste')
    nnoremap <silent><buffer><expr> x
    \ defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> .
    \ defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> q
    \ defx#do_action('quit')
    nnoremap <silent><buffer><expr> <Space>
    \ defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> *
    \ defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> j
    \ line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k
    \ line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> <leader>l
    \ defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <leader>g
    \ defx#do_action('print')
endfunction

" code completion settings
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
set completeopt=longest,menuone,noinsert
imap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"
imap <expr> <CR> pumvisible() ? "\<C-e><CR>" : "\<CR>"
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
let g:neosnippet#enable_completed_snippet = 1

" python settings
autocmd FileType python setlocal ai sw=4 ts=4 sts=4 sr cc=80 et
autocmd FileType python setlocal omnifunc=python3complete#Complete
let g:deoplete#sources#jedi#python_path = system('which python3')[:-2]
let g:python_highlight_all=1
let g:deoplete#sources#jedi#show_docstring = 1
let g:syntastic_python_checkers = ['flake8']
"autocmd FileType python setlocal tags+=$HOME/.config/nvim/tags/python.tags

" javascript settings
autocmd Filetype javascript,js setlocal ai sw=2 ts=2 et
let g:deoplete#sources#ternjs#tern_bin = system('which tern')[:-2]
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#docs = 1
let g:deoplete#sources#ternjs#omit_object_prototype = 0
let g:deoplete#sources#ternjs#include_keywords = 1
let g:syntastic_javascript_checkers = ['eslint']
"autocmd FileType javascript,js setlocal tags+=$HOME/.config/nvim/tags/js.tags

" react.js settings
let g:jsx_ext_required = 0
let g:vim_jsx_pretty_enable_jsx_highlight = 1
let g:vim_jsx_pretty_colorful_config = 1

" C settings
autocmd FileType arduino,c,cpp setlocal ts=4 sts=4 sw=4 et
let g:deoplete#sources#clang#libclang_path = "/usr/lib/llvm-6.0/lib/libclang.so"
let g:deoplete#sources#clang#clang_header = "/usr/lib/llvm-6.0/include/clang/"
"autocmd FileType arduino,c setlocal tags+=$HOME/.config/nvim/tags/c.tags

" LaTeX
" TODO: set checkers to act like texstudio
" pt-br dictionary needs to be compiled manually
autocmd FileType tex setlocal spelllang=pt-br spell tw=79 ai sw=4 ts=4 cc=80
let g:syntastic_tex_checkers = ['']
let g:vimtex_view_method = 'zathura'
if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete

let g:term_buf = 0
let g:term_win = 0
function! Term_toggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction
