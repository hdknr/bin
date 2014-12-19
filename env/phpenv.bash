export PATH=$HOME/.rbenv/bin:$HOME/.phpenv/bin:$PATH
eval "$(rbenv init -)"
eval "$(phpenv init -)"

function PHP_GET_COMPOSER()
{
    curl -s http://getcomposer.org/installer | php
}

function PHP_SET_VER()
{
    export PHP_VER=$(phpenv version|awk '{print $1}');
}

function PHP_SET_PATH()
{
    PHP_SET_VER;
    export PHP_PATH=$HOME/.phpenv/versions/$PHP_VER;
}
