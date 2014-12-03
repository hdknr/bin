#/bin/bash

DEBIAN=(
    tmux
)

# Debian
[ -n "`/usr/bin/apt-get`" ] && sudo apt-get update && sudo apt-get install "${DEBIAN[@]}" -y

# .tmux.conf

ln -s ~/bin/home/.tmux.conf ~/.tmux.conf
