#!/bin/bash

mkdir -p ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
ln -s ~/bin/home/.vimrc .vimrc
