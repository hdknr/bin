for i in apt-get yum brew; do
    export PKG=`which $i`
    if [ -n "$PKG" ]; then break; fi;
done

if [ -n "$PKG" ]; then
    export DISTRIB=$(grep PRETTY_NAME /etc/*-release | sed -E  "s/(.+)\((.+)\).+/\2/")
fi

distrib(){
    echo $(grep PRETTY_NAME /etc/*-release | sed -E  "s/(.+)\((.+)\).+/\2/")
}

if_deb(){
 [[ `distrib` == $1 ]];
}
