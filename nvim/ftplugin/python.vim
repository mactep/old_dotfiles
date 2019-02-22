setlocal cc=100 keywordprg=pydoc3 scl=yes
let g:python_highlight_all=1

" sets the default python3 binary (may not be right for some distros)
" also fixes the behavior of jedi on virtual environments
let g:python3_host_prog = '/usr/bin/python3'
