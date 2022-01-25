#!/bin/bash
BASE=$1
find $BASE -maxdepth 1 -type d | while read dn ; do
  if [ -d "$dn/.git" ]; then
    pushd .
    echo "*** ${dn}"
    cd $dn
    git pull
    echo $dn
    popd
  fi
done
