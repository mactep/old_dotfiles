if &compatible
    set nocompatible
endif

let g:dein_dir = $HOME . '/.config/nvim/repos/github.com/Shougo/dein.vim'
if !isdirectory(g:dein_dir)
    call mkdir(g:dein_dir, 'p')
    execute '!git clone https://github.com/Shougo/dein.vim' g:dein_dir
endif

execute 'set runtimepath+=' . g:dein_dir

if dein#load_state('$HOME/.config/nvim/')
    call dein#begin('$HOME/.config/nvim/')

    call dein#add(g:dein_dir)

    call dein#add('morhetz/gruvbox')
    call dein#add('davidhalter/jedi-vim')

    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
    call dein#install()
endif

" colorscheme
" set termguicolors
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_sign_column='bg0'
colorscheme gruvbox

" general settings
set autochdir
set clipboard=unnamed
set completeopt=longest,menuone,noinsert,noselect
set hidden
set inccommand=nosplit
set list
set listchars=eol:¬,tab:..,trail:.
set noshowmode
set nowrap
set number
set scrolloff=8
set splitbelow
set splitright
set undofile
"set directory=~/.config/nvim/swap//

" indentation
set autoindent
set expandtab
set smarttab
set shiftround
set tabstop=4
set shiftwidth=4
set softtabstop=4

" neovim terminal
autocmd TermOpen * setlocal nonumber
autocmd TermOpen * startinsert
" autocmd BufEnter term://* startinsert

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 0
let g:netrw_winsize = 0
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
" tree listing is bugged
" autocmd FileType netrw setl bufhidden=delete

" set completeopt=longest,menuone,noinsert,noselect
set pumheight=12

" source
source ~/.config/nvim/settings/mappings.vim
source ~/.config/nvim/settings/functions.vim
