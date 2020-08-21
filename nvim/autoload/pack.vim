function! pack#start()
    let g:pack_dir = $HOME . '/.config/nvim/pack/plugins/'
    let g:pack_start_dir = g:pack_dir . 'start/'
    let g:pack_opt_dir = g:pack_dir . 'opt/'
    if !isdirectory(g:pack_dir)
        call mkdir(g:pack_dir, 'p')
        call mkdir(g:pack_start_dir)
        call mkdir(g:pack_opt_dir)
    endif
endfunction

function! s:parse_url(github_url)
    let list_ = split( a:github_url, '/' )
    let repo = list_[0]
    let plugin = list_[1]
    if len(list_) == 4
        let branch = list_[3]
    else
        let branch = 'master'
    endif
    return [repo, plugin, branch]
endfunction

function! pack#add(plugin, dir)
    let [repo, plugin, branch] = s:parse_url(a:plugin)
    let plugin_dir = a:dir . plugin

    if !isdirectory(plugin_dir)
        execute '!git clone https://github.com/'.repo.'/'.plugin.' -b '.branch.' '.plugin_dir
        execute 'packadd '.plugin_dir
        execute 'helptags '.plugin_dir
    endif
    " TODO: find a fix to the helptags. opt packages needs to be loaded before
    " generating tags. helptags ALL gives errors if it's run everytime
endfunction

function! pack#add_start(plugin)
    call pack#add(a:plugin, g:pack_start_dir)
endfunction

function! pack#add_opt(plugin)
    call pack#add(a:plugin, g:pack_opt_dir)
endfunction
