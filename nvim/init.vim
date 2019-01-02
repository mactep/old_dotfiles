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
    call dein#add('itchyny/lightline.vim')
    call dein#add('airblade/vim-gitgutter')
    call dein#add('Shougo/defx.nvim')
    call dein#add('kristijanhusak/defx-git')

    call dein#add('ludovicchabant/vim-gutentags')
    call dein#add('scrooloose/nerdcommenter')

    call dein#add('lervag/vimtex', {'on_ft': 'tex'})
    call dein#add('vim-python/python-syntax', {'on_ft': 'python'})

    call dein#add('Shougo/deoplete.nvim')
    call dein#add('autozimu/LanguageClient-neovim', {
                \ 'rev': 'next',
                \ 'build': 'bash install.sh',
                \})
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('Shougo/echodoc.vim')

    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
    call dein#install()
endif

" colorscheme
set termguicolors
let g:gruvbox_contrast_dark='hard'
set background=dark
colorscheme gruvbox

" general settings
set autochdir
set clipboard=unnamed
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
set smartindent
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4


" terminal
autocmd TermOpen * setlocal nonumber
autocmd TermOpen * startinsert
autocmd BufEnter term://* startinsert

" source
source ~/.config/nvim/settings/statusline.vim
source ~/.config/nvim/settings/mappings.vim
source ~/.config/nvim/settings/completion.vim
source ~/.config/nvim/settings/gutentags.vim
source ~/.config/nvim/settings/defx.vim
source ~/.config/nvim/settings/echodoc.vim
source ~/.config/nvim/settings/gitgutter.vim
source ~/.config/nvim/settings/functions.vim
