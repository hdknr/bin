function SET_ENV()
{
    [ ! -f ~/.bash_extra/$1.bash ] && [ -f ~/bin/env/$1.bash ] && ln -s ~/bin/env/$1.bash ~/.bash_extra/$1.bash;
}

function BIN_INIT()
{
    [ -n "$1" ]  && SET_ENV $1;
    if [ -n "`which apt-get`" ]; then
        export BIN_OS="DEBIAN";
        export BIN_PKG="sudo apt-get update && apt-get install -y";
    elif [ -n "`which yum`" ]; then  
        export BIN_OS="CENTOS";
        export BIN_PKG= "yum install";
    elif [ -n "`which brew`" ]; then
        export BIN_OS="OSX";
        export BIN_PKG="brew install";
    fi    
}
function BIN_EXIT()
{
    unset BIN_OS; unset BIN_PKG;
    exit;
}

function PACKAGES()
{   
    if [ -n "`which ap-get`" ]; then
        sudo apt-get update && apt-get install -y $@; 
    elif [ -n "`which yum`" ]; then  
        sudo yum install $@;
    elif [ -n "`which brew`" ]; then
        brew install $@;
    fi    
}
