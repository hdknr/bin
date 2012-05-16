" $ ln -s bin/Linux/res/default.vimrc .vimrc
"
filetype off

"-----  Vundle 
set rtp+=~/.vim/vundle/
call vundle#rc()

Bundle 'thinca/vim-ref'
Bundle 'tpope/vim-surround'
Bundle 'mattn/gist-vim'
Bundle 'hdknr/orevim'
"Bundle 'Shougo/neocomplcache'
"Bundle 'Shogo/unite.vim'
"Bundle 'scrooloose/nerdcommenter'
"Bundle 'thinca/vim-puickrun'
"Bundle 'kana/vim-fakeclip'


"
syntax on
filetype plugin on
colorscheme elflord
" ** pydiction **
let g:pydiction_location = '/home/hdknr/.vim/after/ftplugin/pydiction/complete-dict'
let g:pydiction_menu_height = 20
"
set ts=4
set sw=4
set expandtab
colorscheme elflord

" ** github(gist) **
let g:github_user=$GITHUB_API_USER
let g:github_token=$GITHUB_API_TOKEN

" taglist si ctags
"let Tlist_Ctags_Cmd='/usr/bin/ctags'
"let Tlist_Use_Right_Window = 1
"

" omnifunc
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType c set omnifunc=ccomplete#Comple
"

"------
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent

au FileType javascript imap <c-t> AJS.log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return
au FileType javascript inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi

function! JavaScriptFold()
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
    return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction


"--- You complete things with CTRL-X O.
"
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete



"Higlight current line only in insert mode
"
autocmd InsertLeave * set nocursorline
autocmd InsertEnter * set cursorline
""Highlight cursor
highlight CursorLine ctermbg=8 cterm=NONE



"Incremental search
" Called ‘incremental search’ in Vim, it’s a great feature. The editor will
" start searching as soon as you start typing the keyword.
set incsearch



" To display line numbers on the left margin, add this to the .vimrc:
" Show line number
set number

