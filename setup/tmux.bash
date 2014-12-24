#/bin/bash
source `dirname $0`/conf.bash
BIN_INIT tmux

# .tmux.conf
[ -f ~/bin/home/.tmux.conf  ] || ln -s ~/bin/home/.tmux.conf ~/.tmux.conf;

if [ -n "`which tmux`"  ]; then
    BIN_EXIT;
fi

case "$BIN_OS" in 
  "DEBIAN") 
    PKGS=(tmux);;
 "CENTOS")   
    PKGS=(tmux);;
 "OSX")
    PKGS=(tmux);;
esac;

$BIN_PKG "${PKGS[@]}";
