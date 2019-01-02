setlocal spelllang=pt-br spell tw=79 cc=80
let g:vimtex_view_method = 'zathura'
if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete
