#!/bin/bash

P=`dirname $0`
if [ $P == '.' ] ; then
    BASE='..'
else
    BASE=`dirname $P`
fi

source  $BASE/bash/dist.bash

if [ -n "$NTPSERVER" ] ;then
    sudo ntpdate $NTPSERVER ;
else
    sudo ntpdate time.apple.com
fi

case $DIST in 
  'Debian') sudo aptitude update ; sudo aptitude safe-upgrade -y ;; 
  'Ubuntu') sudo aptitude update ; sudo aptitude safe-upgrade -y ;; 
  'CentOS') sudo yum update -y ;;
esac

#
# bin/* 
pushd .
cd ~/bin/
git pull
popd 
