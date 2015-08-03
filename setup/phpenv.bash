#/bin/bash
source `dirname $0`/conf.bash
BIN_INIT phpenv

if [ -d ~/.phpenv ]; then
   echo "phpenv seems to to be already installed.";
   BIN_EXIT;
fi

if [ -d ~/.anyenv/envs/phpenv ]; then
   echo "anyenv+phpenv seems to to be already installed.";
   BIN_EXIT;
fi

case "$BIN_OS" in 
  "DEBIAN") 
    PKGS=(
    git git-core
    curl libcurl4-gnutls-dev
    build-essential
    libxml2-dev
    libssl-dev
    libjpeg-dev
    libpng12-dev
    libmcrypt-dev
    libreadline-dev
    libtidy-dev
    libxslt1-dev
    autoconf
    );;
 "CENTOS") 
    PKGS=(
    enchant-devel
    freetype-devel
    gettext-devel
    gmp-devel
    libXpm-devel
    libc-client-devel
    libcurl curl-devel
    libicu libicu-devel
    libjpeg-devel
    libpng-devel
    libtidy-devel
    libxml2-devel
    libxslt-devel
    libxslt-devel
    net-snmp-devel
    t1lib-devel
    );;
 "OSX");;
esac;

# Package Install
$BIN_PKG "${PKGS[@]}";

if [ "$(which anyevn)" == "" ]; then
    # Install
    curl https://raw.githubusercontent.com/CHH/phpenv/master/bin/phpenv-install.sh | bash

    # php-build
    git clone git://github.com/CHH/php-build.git ~/.phpenv/plugins/php-build
else
    anyenv install phpenv
fi
