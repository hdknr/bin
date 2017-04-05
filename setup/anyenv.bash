#!/bin/bash
PKGS=(
    build-essential
    curl
    libbz2-dev
    libreadline-dev
    libsqlite3-dev
    libssl-dev
    llvm
    make
    wget
    zlib1g-dev
)

sudo apt-get update && sudo apt-get install -y  "${PKGS[@]}"
git clone https://github.com/riywo/anyenv ~/.anyenv
