if &compatible
  set nocompatible
endif

" Required:
set runtimepath+=/home/mactep/.config/nvim/./repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/mactep/.config/nvim/')
  call dein#begin('/home/mactep/.config/nvim/')

  " Required:
  call dein#add('/home/mactep/.config/nvim/./repos/github.com/Shougo/dein.vim')

  call dein#add('vim-airline/vim-airline')
  call dein#add('morhetz/gruvbox')
  call dein#add('airblade/vim-gitgutter')
  "call dein#add('scrooloose/nerdtree')
  "call dein#add('jistr/vim-nerdtree-tabs')
  "call dein#add('Xuyuanp/nerdtree-git-plugin')
  "call dein#add('tpope/vim-fugitive')
  "call dein#add('majutsushi/tagbar')

  call dein#add('scrooloose/nerdcommenter')
  call dein#add('Raimondi/delimitMate')
  call dein#add('scrooloose/syntastic')
  call dein#add('chrisbra/Colorizer')
  call dein#add('ludovicchabant/vim-gutentags')

  call dein#add('vim-python/python-syntax')
  call dein#add('pangloss/vim-javascript')
  call dein#add('MaxMEllon/vim-jsx-pretty')
  "call dein#add('donRaphaco/neotex')
  "call dein#add('lervag/vimtex')

  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('zchee/deoplete-jedi')
  call dein#add('zchee/deoplete-clang')
  call dein#add('carlitux/deoplete-ternjs')
  "call dein#add('Shougo/neco-syntax')
  "call dein#add('wokalski/autocomplete-flow')
  "call dein#add('SirVer/ultisnips')
  "call dein#add('honza/vim-snippets')
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

" general settings
set number relativenumber
set encoding=utf8
"set list 						" show invisibles
"set listchars=eol:¬,tab:..,trail:.
set termguicolors 					" this bugs on the xfce terminal
let g:gruvbox_contrast_dark='hard'
set background=dark
colorscheme gruvbox
set clipboard=unnamed 					" paste from system clipboard
set autochdir 						" automaticaly ch into the file directory
set splitbelow
set splitright
let g:airline_powerline_fonts=1 			" need to install powerline fonts
"set tags+=.git/tags;
"set foldmethod=indent

" shortcuts
inoremap <S-Tab> <C-d>
nnoremap <S-Tab> <<
nnoremap <Tab> >>
vnoremap <S-Tab> <gv
vnoremap <Tab> >gv

nnoremap <Home> ^

nnoremap <C-s> :w<CR>
vnoremap <C-s> <C-C>:w<CR>
inoremap <C-s> <C-O>:w<CR>

let mapleader = ','

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

" delimitMate settings
let delimitMate_jump_expansion = 0
let delimitMate_expand_cr = 1

" gutentags
let g:gutentags_ctags_tagfile=".tags"
set tags+=./.tags;

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
noremap <leader>sr :SyntasticReset<CR>
noremap <leader>sc :SyntasticCheck<CR>

"" NERDTree settings
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>

" code completion settings
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_smart_case = 1
set completeopt=longest,menuone,noinsert
imap <expr> <Tab> pumvisible() ? "\<C-y>" : (neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<Tab>")
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
let g:neosnippet#enable_completed_snippet = 1
"set omnifunc=syntaxcomplete#Complete
"if has('conceal')
  "set conceallevel=2 concealcursor=niv
"endif
"let g:neosnippet#snippets_directory='~/.config/nvim/repos/github.com/honza/vim-snippets/snippets'
"let g:neosnippet#disable_runtime_snippets = {'_' : 1,}
"if !exists('g:deoplete#omni#input_patterns')
  "let g:deoplete#omni#input_patterns = {}
"endif

" python settings
autocmd FileType python setlocal ai sw=4 ts=4 tw=79 sts=4 sr cc=80 et
autocmd FileType python setlocal omnifunc=python3complete#Complete
let g:python_highlight_all=1
let g:deoplete#sources#jedi#python_path = '/usr/bin/python3'
let g:deoplete#sources#jedi#show_docstring = 1
let g:syntastic_python_checkers = ['flake8']
"autocmd FileType python setlocal tags+=/home/mactep/.config/nvim/tags/python.tags

" javascript settings
autocmd Filetype javascript,js setlocal ai sw=2 ts=2 et
let g:deoplete#sources#ternjs#tern_bin = '/usr/local/bin/tern'
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#docs = 1
let g:deoplete#sources#ternjs#omit_object_prototype = 0
let g:deoplete#sources#ternjs#include_keywords = 1
let g:syntastic_javascript_checkers = ['eslint']
"autocmd FileType javascript,js setlocal tags+=/home/mactep/.config/nvim/tags/js.tags
" Use tern_for_vim.
"let g:tern#command = ["tern"]
"let g:tern#arguments = ["--persistent"]
"let g:tern_show_argument_hints="on_hold"
"let g:tern_show_signature_in_pum = 1
"autocmd FileType javascript,js setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType javascript,js setlocal omnifunc=tern#Complete

" react.js settings
let g:jsx_ext_required = 0 				" Allow JSX in normal JS files
let g:vim_jsx_pretty_enable_jsx_highlight = 1
let g:vim_jsx_pretty_colorful_config = 1

" C settings
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.8/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-3.8/lib/clang'
autocmd FileType arduino,c setlocal ts=2 sts=2 sw=2 et
"autocmd FileType arduino,c setlocal tags+=/home/mactep/.config/nvim/tags/c.tags

" LaTeX
" pt_BR spelling needs to be generated, just google it
autocmd FileType tex setlocal spelllang=pt spell
autocmd FileType tex :NeoTex
let g:syntastic_tex_checkers = ['']
let g:neotex_enabled = 2
"let g:neotex_pdflatex_add_options = '-synctex=1'
"let g:neotex_latexdiff = 1
"let g:tex_flavor = 'latex'
"let g:vimtex_view_method = 'zathura'

function! Zathura_forward_search()
    let zathura = 'silent !zathura --synctex-forward '
    let position = line('.').':'.col('.').':'
    let tex_file = b:neotex_tempname
    let pdf_file = fnameescape(expand('%:p:r')).'.pdf &'
    ":echo(zathura.position.tex_file.' '.pdf_file)
    exec zathura.position.tex_file.' '.pdf_file
    "exec "silent !zathura --synctex-forward ".line(".").":".col(".").":".b:neotex_tempname." ".fnameescape(expand('%:p:r')).".pdf &"
endfunction
au FileType tex nmap <F5> :call Zathura_forward_search()<CR>

" need to get the temp file name (I've modified the neotex plugin)
"function! Zathura_fsearch()
"	exec "silent !zathura --synctex-forward ".line(".").":".col(".").":".b:neotex_tempname." ".expand('%:r').".pdf &"
"	":echo("silent !zathura --synctex-forward ".line(".").":".col(".").":".b:neotex_tempname." ".expand('%:r').".pdf &")
"endfunction
"au FileType tex nmap <Leader>f :call Zathura_fsearch()<CR>

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
nnoremap <leader>t :call Term_toggle(10)<cr>
tnoremap <leader>t <C-\><C-n>:call Term_toggle(10)<cr>

