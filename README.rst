.bash_extra
============

- mkdir ~/.bash_extra
- add the end of ~/.bashrc or  ~/.profile

::

    # bash extras
    if [ -d ~/.bash_extra ]; then
        for sc  in ~/.bash_extra/* ; do
            source $sc ; 
        done
    fi

- put __localconfig__.bash or symlink to ~/bin/bash/__some__.bash on ~/.bash_extra
- source .bashrc

.vim and .vimrc
==================

Use vim Vundle

- http://note.harajuku-tech.org/vim-vundle

::

    $ cd
    $ ln -s bin/home/.vimrc 

::

    :BundleInstall

home
======

- files used at ~/
