#!/bin/bash

if [ "`which brew`" != "" ]; then
  brew install nvm;
fi
ln -s ~/bin/env/nvm.bash ~/.bash_extra/nvm.bash
