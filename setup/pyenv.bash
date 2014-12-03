#/bin/bash

DEBIAN=(
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

REDHAT=(
    bzip2
    bzip2-devel
    gcc
    gcc-c++
    git
    make
    openssl-devel
    patch
    python26 
    python26-devel
    readline-devel
    sqlit
    sqlite-devel
    vim
    zlib-devel
)

# Packages
[ -n "`which apt-get`" ] && sudo apt-get update && sudo apt-get install "${DEBIAN[@]}" -y
[ -n "`which yum`" ] && sudo apt-get update && sudo apt-get install "${REDHAT[@]}" -y

# pyenv Install
cd
git clone git://github.com/yyuu/pyenv.git .pyenv


# pyenv-virtual 
git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv

echo "source ~/bin/env/pyenv.bash"
