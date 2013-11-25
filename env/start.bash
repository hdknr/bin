# bash extras
if [ -d ~/.bash_extra ]; then
    for sc  in ~/.bash_extra/* ; do
        source $sc ; 
    done
fi
