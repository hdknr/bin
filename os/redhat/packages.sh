#!/bin/bash
PKGS=(
    # libmcrypt
    # libmcrypt-devel
    # libtidy
    # libtidy-devel
    # re2c
    autoconf
    automake
    bison
    cmake
    curl-devel
    freetype
    freetype-devel
    gcc
    gcc-c++
    libcurl-devel
    libffi-devel
    libgcc
    libicu-devel
    libjpeg-turbo
    libjpeg-turbo-devel
    libpng
    libpng-devel
    libxml2
    libxml2-devel
    libxslt
    libxslt-devel
    ncurses-devel
    openssl-devel
    readline-devel
    sqlite
    sqlite-devel
    zlib-devel
)
sudo yum check-update && sudo yum install -y "${PKGS[@]}"
