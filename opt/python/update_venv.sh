#!/bin/bash

PY_VER=$1
VENV_NAME=$2

REQ=/tmp/requirements.txt

pip freeze > $REQ
pyenv virtualenv-delete $VENV_NAME
pyenv virtualenv $PY_VER $VENV_NAME
pip install -r  $REQ
rm $REQ