#!/bin/zsh
PKGS=(
    coreutils
    fontconfig
    freetds
    freetype
    fribidi
    gcc
    gd
    gdbm
    gettext
    ghostscript
    git
    glib
    gmp
    graphite2
    graphviz
    gts
    harfbuzz
    icu4c
    ilmbase
    imagemagick
    isl
    jasper
    jpeg
    jq
    libde265
    libevent
    libffi
    libheif
    libidn2
    libmpc
    libomp
    libpng
    libtiff
    libtool
    libunistring
    little-cms2
    lzo
    mpfr
    # msodbcsql17
    # mssql-tools
    mysql-client
    mysql-connector-c
    ncurses
    netpbm
    oniguruma
    openexr
    openjpeg
    openssl
    # openssl@1.1
    pango
    pcre
    pcre2
    pixman
    pwgen
    readline
    shared-mime-info
    sqlite
    telnet
    tmux
    tree
    unixodbc
    utf8proc
    vim
    webp
    wget
    x265
    xz
    zsh-completions
)
brew update && brew install "${PKGS[@]}"
