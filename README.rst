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

Requiremeint
--------------------

.. code-block:: bash
    
    sudo aptitude install git mercurial subversion

Use vim Vundle
---------------------

- http://note.harajuku-tech.org/vim-vundle

::

    $ cd
    $ ln -s bin/home/.vimrc 

::

    :BundleInstall

Neobundle
------------

- http://note.harajuku-tech.org/neobundle-vim

::

    $ mkdir -p ~/.vim/bundle
    $ git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
    $ ln -s ~/bin/home/.vimrc .vimrc

home
======

- files used at ~/
