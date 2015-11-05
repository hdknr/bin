#!/bin/bash
# .tmux.conf
[ -f ~/.tmux.conf ] || cp ~/bin/home/.tmux.conf ~/.tmux.conf;

if which tmux >/dev/null; then
    echo exists
else
    echo install tmux with ansible playbook
fi
