export PATH=$HOME/.rbenv/bin:$HOME/.phpenv/bin:$PATH
eval "$(rbenv init -)"
eval "$(phpenv init -)"

function PHP_GET_COMPOSER()
{
    curl -s http://getcomposer.org/installer | php
}
