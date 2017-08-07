if !&compatible
  set nocompatible 
endif

" reset augroup ---
augroup MyAutoCmd
  autocmd! 	
augroup END

" dein settings {{{
" > INSTALL dein automatically ---
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.vim') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath

" > PLUGIN and CACHE ---
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/.dein.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir, [$MYVIMRC, s:toml_file])
  call dein#load_toml(s:toml_file)
  call dein#end()
  call dein#save_state()
endif

" > PLUGIN AUTO INSTALL ---
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
" }}}

" > open NERDTree if no argument ---
let file_name = expand('%')
if has('vim_starting') &&  file_name == ''
  autocmd VimEnter * NERDTree ./
endif

"End dein Scripts-------------------------

" {{{
syntax on
set ts=4
set sw=4
set expandtab
" }}}
