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

  call dein#add('scrooloose/nerdcommenter')
  call dein#add('Raimondi/delimitMate')
  call dein#add('scrooloose/syntastic')
  call dein#add('chrisbra/Colorizer')
  call dein#add('ludovicchabant/vim-gutentags')

  call dein#add('vim-python/python-syntax')
  call dein#add('pangloss/vim-javascript')
  call dein#add('MaxMEllon/vim-jsx-pretty')
  call dein#add('lervag/vimtex')
  "call dein#add('mactepp/neotex')

  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('zchee/deoplete-jedi')
  call dein#add('zchee/deoplete-clang')
  call dein#add('carlitux/deoplete-ternjs')
  "call dein#add('SirVer/ultisnips')
  "call dein#add('honza/vim-snippets')

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
set list 					" show invisibles
set listchars=eol:¬,tab:..,trail:.
set termguicolors
let g:gruvbox_contrast_dark='hard'
set background=dark
colorscheme gruvbox
set clipboard=unnamed 				" paste from system clipboard
set autochdir 					" automaticaly ch into the file directory
set splitbelow					" open windows bellow the current window
set splitright					" open windows to the right of the current window
"set foldmethod=indent				" fold code based on indentation

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

" airline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" delimitMate settings
let delimitMate_jump_expansion = 0
let delimitMate_expand_cr = 1

" gutentags
" TODO: hide the 'tags' file inside .git folder
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
imap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"
imap <expr> <CR> pumvisible() ? "\<C-e><CR>" : "\<CR>"
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
let g:neosnippet#enable_completed_snippet = 1
"set omnifunc=syntaxcomplete#Complete

" python settings
autocmd FileType python setlocal ai sw=4 ts=4 tw=79 sts=4 sr cc=80 et
autocmd FileType python setlocal omnifunc=python3complete#Complete
let g:python_highlight_all=1
"let g:deoplete#sources#jedi#python_path = '/usr/bin/python3'
let g:deoplete#sources#jedi#python_path = system('which python3')
let g:deoplete#sources#jedi#show_docstring = 1
let g:syntastic_python_checkers = ['flake8']
"autocmd FileType python setlocal tags+=/home/mactep/.config/nvim/tags/python.tags

" javascript settings
autocmd Filetype javascript,js setlocal ai sw=2 ts=2 et
"let g:deoplete#sources#ternjs#tern_bin = '/usr/local/bin/tern'
let g:deoplete#sources#ternjs#tern_bin = system('which tern')
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#docs = 1
let g:deoplete#sources#ternjs#omit_object_prototype = 0
let g:deoplete#sources#ternjs#include_keywords = 1
let g:syntastic_javascript_checkers = ['eslint']
"autocmd FileType javascript,js setlocal tags+=/home/mactep/.config/nvim/tags/js.tags

" react.js settings
let g:jsx_ext_required = 0 			" Allow JSX in normal JS files
let g:vim_jsx_pretty_enable_jsx_highlight = 1
let g:vim_jsx_pretty_colorful_config = 1

" C settings
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.8/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-3.8/lib/clang'
autocmd FileType arduino,c setlocal ts=2 sts=2 sw=2 et
"autocmd FileType arduino,c setlocal tags+=/home/mactep/.config/nvim/tags/c.tags

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

"" IMPORTANT: zathura needs to be opened manually
"" TODO: use a tempfile to avoid saving the file all the time
"function! Latex_compile_and_jump()
"    let zathura = 'zathura --synctex-forward '
"    let position = line('.').':'.col('.').':'
"    "let tex_file = b:neotex_tempname
"    let pdf_file = fnameescape(expand('%:p:r')).'.pdf'
"    let tex_file = fnameescape(expand('%:p'))
"    let pdflatex = 'silent !pdflatex -synctex=1 -interaction=nonstopmode '
"    exec pdflatex.tex_file.' '.pdf_file.'; '.zathura.position.tex_file.' '.pdf_file.' &'
"endfunction
"function! Latex_compile_bib()
"    let bibtex = '!bibtex '
"    let bib_file = fnameescape(expand('%:r'))
"    echo(bib_file)
"    exec bibtex.bib_file
"endfunction
"nmap <F5> :call Latex_compile_and_jump()<CR>
"nmap <leader>lb :call Latex_compile_bib()<CR>

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

