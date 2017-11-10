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

  call dein#add('scrooloose/nerdtree')
  call dein#add('vim-airline/vim-airline')
  call dein#add('morhetz/gruvbox')

  call dein#add('scrooloose/nerdcommenter')
  call dein#add('Raimondi/delimitMate')

  call dein#add('w0rp/ale') 				" asynchronous syntastic
  call dein#add('vim-python/python-syntax')
  call dein#add('pangloss/vim-javascript')
  call dein#add('MaxMEllon/vim-jsx-pretty')
  "call dein#add('mxw/vim-jsx')

  call dein#add('honza/vim-snippets')
  call dein#add('SirVer/ultisnips')
  call dein#add('ervandew/supertab')
  call dein#add('ludovicchabant/vim-gutentags')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('zchee/deoplete-jedi')
  call dein#add('zchee/deoplete-clang')
  call dein#add('carlitux/deoplete-ternjs')

  call dein#add('jistr/vim-nerdtree-tabs')

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
set number 						" line number
set encoding=utf8 					" default encoding
set list 						" show invisibles
set termguicolors 					" this bugs on the xfce terminal
set background=dark
colorscheme gruvbox
set listchars=eol:¬,tab:..,trail:.
set clipboard=unnamed 					" paste from system clipboard
set autochdir 						" automaticaly ch into the file directory
set completeopt=longest,menuone
set splitbelow
set splitright

" shortcuts
inoremap <S-Tab> <C-d>
nnoremap <S-Tab> <<
nnoremap <Tab> >>
vnoremap <S-Tab> <gv
vnoremap <Tab> >gv

nnoremap <Home> ^

nnoremap <C-s> :update<CR>
vnoremap <C-s> <C-C>:update<CR>
inoremap <C-s> <C-O>:update<CR>

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
let delimitMate_jump_expansion = 1
let delimitMate_expand_cr = 1

" NERDTree settings
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>

" code completion settings
let g:deoplete#enable_at_startup = 1
set omnifunc=syntaxcomplete#Complete
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" python settings
autocmd FileType python setlocal ai sw=4 ts=4 tw=79 sts=4 sr cc=80 et
autocmd FileType python setlocal omnifunc=python3complete#Complete
autocmd FileType python setlocal tags+=/home/mactep/.config/nvim/tags/python.tags
let g:python_highlight_all=1
let g:deoplete#sources#jedi#python_path = '/usr/bin/python3'

" javascript settings
autocmd Filetype javascript,js setlocal ai sw=4 ts=4 et
autocmd FileType javascript,js setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType javascript,js setlocal tags+=/home/mactep/.config/nvim/tags/js.tags
let g:deoplete#sources#ternjs#tern_bin = '/usr/local/bin/tern'

" react.js settings
let g:jsx_ext_required = 0 				" Allow JSX in normal JS files
let g:vim_jsx_pretty_enable_jsx_highlight = 1
let g:vim_jsx_pretty_colorful_config = 1

" C settings
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.8/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-3.8/lib/clang'
autocmd FileType arduino,c setlocal tags+=/home/mactep/.config/nvim/tags/c.tags
autocmd FileType arduino,c setlocal ts=2 sts=2 sw=2 et
