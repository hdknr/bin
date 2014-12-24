#/bin/bash
source `dirname $0`/conf.bash
BIN_INIT phpenv

if [ -d ~/.phpenv ]; then
   echo "phpenv seems to to be already installed.";
   BIN_EXIT;
fi

case "$BIN_OS" in 
  "DEBIAN") 
    PKGS=(
    git
    git-core
    curl
    build-essential
    libxml2-dev
    libssl-dev
    libcurl4-gnutls-dev
    libjpeg-dev
    libpng12-dev
    libmcrypt-dev
    libreadline-dev
    libtidy-dev
    libxslt1-dev
    autoconf
    );;
 "CENTOS") ;;
 "OSX");;
esac;

# Package Install
$BIN_PKG "${PKGS[@]}";

# Install
curl https://raw.githubusercontent.com/CHH/phpenv/master/bin/phpenv-install.sh | bash

# php-build

git clone git://github.com/CHH/php-build.git ~/.phpenv/plugins/php-build
