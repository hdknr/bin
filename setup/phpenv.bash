#/bin/bash
PKGS=(
    re2c
    libxml2
    libxml2-dev
    libssl-dev
    bison
    pkg-config
    libcurl4-gnutls-dev
    libjpeg-turbo8-dev
    libpng-dev
    libmcrypt-dev
    libtidy-dev
    libxslt1-dev
    autoconf
    automake
)
sudo apt-get update && sudo apt-get install -y  "${PKGS[@]}"
