#!/bin/bash
source `dirname $0`/conf.bash

# - OS Dependencies

case "$BIN_OS" in 
  "DEBIAN") 
    PKGS=(
    build-essential
    libncurses5-dev
    openssl
    libssl-dev
    curl
    git-core
    );;
 "CENTOS")   
    PKGS=(
    gcc
    glibc-devel
    make
    ncurses-devel
    openssl-devel
    autoconf
    curl
    git
    );;
esac;

# https://github.com/spawngrid/kerl
# Easy building and installing of Erlang/OTP instances
DST=~/erlang;
if [ -f "$DST/kerl" ] ; then
    echo "kerl seems to be there."
else
    mkdir -p $DST;cd $DST;
    echo "Downloading kerl to $PWD";
    curl -O https://raw.githubusercontent.com/spawngrid/kerl/master/kerl
fi
chmod a+x $DST/kerl

# Default Config Options
RC=~/.kerlrc
OPTS=(
    --disable-hipe
    --enable-smp-support
    --enable-threads
    --enable-kernel-poll
)
if [ ! -f $RC ]; then
    echo "Default Config Options";
    echo KERL_CONFIGURE_OPTIONS="\"${OPTS[@]}\"" | tee $RC;
fi

