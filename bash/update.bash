#!/bin/bash

P=`dirname $0`
if [ $P == '.' ] ; then
    BASE='..'
else
    BASE=`dirname $P`
fi

source  $BASE/Linux/dist.sh

if [ -n "$NTPSERVER" ] ;then
    sudo ntpdate $NTPSERVER ;
else
    sudo ntpdate time.apple.com
fi

case $DIST in 
  'Debian') sudo aptitude update ; sudo aptitude safe-upgrade ;; 
  'Ubuntu') sudo aptitude update ; sudo aptitude safe-upgrade ;; 
  'CentOS') sudo yum update -y ;;
esac

#
# bin/* 
for x in ~/bin/* ;do 
    if [ -d $x ]; then  
        if [ -d $x/.svn ] ; then 
            echo $x ; 
            svn update  $x ; 
        fi;
    fi; 
done
#

