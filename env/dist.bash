for i in apt-get yum brew; do
    export PKG=`which $i`
    if [ -n "$PKG" ]; then break; fi;
done

distrib(){
    echo $(grep PRETTY_NAME /etc/*-release | sed -E  "s/(.+)\((.+)\).+/\2/")
}

if_deb(){
 [[ `distrib` == $1 ]];
}
