#!/bin/bash
# - Anyenv:  https://github.com/riywo/anyenv
# - Python: https://github.com/pyenv/pyenv
# - Node.JS: https://github.com/riywo/ndenv

git clone https://github.com/anyenv/anyenv $HOME/.anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
$HOME/.anyenv/bin/anyenv install --init
#
mkdir -p $(anyenv root)/plugins
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update;
source ~/bin/funcs/env.sh
#
anyenv install pyenv
anyenv install nodenv
source ~/bin/funcs/env.sh
#
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
source ~/bin/funcs/env.sh
