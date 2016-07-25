" dein settings {{{
if &compatible
    set nocompatible
endif
" 
" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END
" 
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" 
if !isdirectory(s:dein_repo_dir)
    call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
execute 'set runtimepath^=' . s:dein_repo_dir

let g:dein#install_max_processes = 16
let g:dein#install_progress_type = 'title'
let g:dein#enable_notification = 1


call dein#begin(s:dein_dir)
" if dein#load_state(s:dein_dir)
"     call dein#begin(s:dein_dir)
"     let s:toml      = '~/.config/dein/plugins.toml'
"     let s:lazy_toml = '~/.config/dein/plugins_lazy.toml'
"     call dein#load_toml(s:toml, {'lazy': 0})
"     call dein#load_toml(s:lazy_toml, {'lazy': 1})
"     call dein#end()
"     call dein#save_state()
" endif

" vimprocだけは最初にインストールしてほしい
if dein#check_install(['vimproc'])
  call dein#install(['vimproc'])
endif
" その他インストール
if has('vim_starting') && dein#check_install()
    call dein#install()
endif
" }}}

" " {{{
set mouse=r
set tabstop=4 shiftwidth=4 expandtab
" " }}}