setlocal spelllang=en spell tw=79 cc=80
CocDisable

augroup md_preview
    autocmd!
    autocmd BufWritePost *.md
        \ if exists("g:preview_pdf_file") |
        \     call MarkdownPreview()      |
        \ endif
augroup END

function! MarkdownPreview()
    let g:preview_pdf_file = get(g:, "preview_pdf_file", tempname().".pdf")
    let s:callback = {'on_exit': function('s:PandocCallback')}
    call jobstart("pandoc ".expand("%:p")." -o ".g:preview_pdf_file, s:callback)

endfunction
nnoremap <leader>mp :call MarkdownPreview()<cr>

function! s:PandocCallback(job_id, data, event)
    let pname = "zathura ".g:preview_pdf_file
    if !system("ps x | grep -v grep | grep '".pname."'")
        call jobstart(pname)
    endif
endfunction
