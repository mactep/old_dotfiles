" colorscheme
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_sign_column='bg0'
colorscheme gruvbox
set termguicolors

" general settings
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
set pumheight=12
set helplang=en

" indentation
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" terminal
autocmd TermOpen * setlocal nonumber
autocmd TermOpen * startinsert

" mappings
let mapleader = ','

nnoremap <silent><esc> :noh<return><esc>

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

nnoremap <A-l> :bnext<cr>
nnoremap <A-h> :bprev<cr>

" Unfuck my screen
nnoremap U :syntax sync fromstart<CR>:redraw!<CR>

" commands
command PrettyJson %!python -m json.tool
command Bd bp | bd#

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 0
let g:netrw_sort_options = "i"
let g:netrw_sort_sequence = "[\/]$"

" source
source ~/.config/nvim/settings/functions.vim

" fuck plaintex
let g:tex_flavor = "latex"

" fixes python integration in virtualenvs
let g:python3_host_prog = '/usr/bin/python3'

" coc.nvim bindings
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Zettelkasten
command! -nargs=1 Search execute 'silent grep! -r -i <args> .' | copen
command! -nargs=1 SearchTag execute 'silent grep! -r -w -i \\#<args> .' | copen
command! Backlinks execute 'silent grep! -H -r % .' | copen
command! -nargs=* ZK execute "edit $ZK_PATH/".strftime("%Y%m%d%H%M")."_<args>.md"
