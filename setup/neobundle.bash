#!/bin/bash


mkdir -p ~/.vim/bundle
if [ ! -d ~/.vim/bundle/neobundle.vim ] ; then
  git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
  git clone https://github.com/Shougo/vimproc.git  ~/.vim/bundle/vimproc
  cd ~/.vim/bundle/vimproc && make
  [ ! -f ~/bin/home/.vimrc ] &&  ln -s ~/bin/home/.vimrc  ~/.vimrc;
fi
