#!/bin/bash

github_update()
{
    NAME=`basename $1`;
    echo $NAME >> .svnignore
    if [ ! -d "$NAME" ] ;then
        echo "$NAME  creaing";
        git clone $1
    else 
        echo "$NAME  updating";
        cd $NAME
        git pull
        cd ..
    fi
}

echo > .svnignore
#
GITHUB="https://github.com/thinca/vim-ref\
    https://github.com/tpope/vim-surround\
    https://github.com/mattn/gist-vim"

cd github
for g in $GITHUB; do
    github_update $g;
done
cd  ..

