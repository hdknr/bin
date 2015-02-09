#/bin/bash
source `dirname $0`/conf.bash
BIN_INIT pyenv

if [ -d ".pyenv" ] ; then
    BIN_EXIT;
fi

case "$BIN_OS" in 
  "DEBIAN") 
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
    );;
 "CENTOS")   
    PKGS=(
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
    );;
esac;

eval "$BIN_PKG ${PKGS[@]}";

# pyenv Install
cd
git clone git://github.com/yyuu/pyenv.git .pyenv

# pyenv-virtual 
git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
