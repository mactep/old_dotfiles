call pack#start()

call pack#add_start('morhetz/gruvbox')
call pack#add_start('neoclide/coc.nvim/tree/release')
call pack#add_start('airblade/vim-gitgutter')

" colorscheme
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

" indentation
set autoindent
set expandtab
set smarttab
set shiftround
set tabstop=4
set shiftwidth=4
set softtabstop=4

" terminal
autocmd TermOpen * setlocal nonumber
autocmd TermOpen * startinsert

" mappings
let mapleader = ','

nnoremap <esc> :noh<return><esc>

vnoremap < <gv
vnoremap > >gv

nnoremap <C-s> :update<CR>
vnoremap <C-s> <C-C>:update<CR>
inoremap <C-s> <C-O>:update<CR>

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

tnoremap <Esc> <C-\><C-n>
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-l> <C-\><C-n><C-w>l

" Unfuck my screen
nnoremap U :syntax sync fromstart<CR>:redraw!<CR>

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 0
let g:netrw_winsize = 0
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
" tree listing is bugged
" autocmd FileType netrw setl bufhidden=delete

set pumheight=12

" source
source ~/.config/nvim/settings/functions.vim

command PrettyJson %!python -m json.tool
