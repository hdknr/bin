#!/bin/zsh
# 
PKGS=(
    mysql-connector-c
    freetds
    jq
)
brew install "${PKGS[@]}"
