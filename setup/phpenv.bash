#/bin/bash

DEBIAN=(
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
)

# Debian
[ -n "`/usr/bin/apt-get`" ] && sudo apt-get update && sudo apt-get install "${DEBIAN[@]}" -y

# Install
curl https://raw.githubusercontent.com/CHH/phpenv/master/bin/phpenv-install.sh | bash

# php-build

git clone git://github.com/CHH/php-build.git ~/.phpenv/plugins/php-build
