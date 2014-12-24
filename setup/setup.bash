#!/bin/bash

EXTRA='
mkdir -p ~/.bash_extra; 
for sc  in ~/.bash_extra/* ; do
  source $sc ; 
done
';

if [ "`which apt-get`" != "" ]; then
  BS=~/.bashrc
elif [ "`which yum`" != "" ] ; then
  BS=~/.bashrc
elif [ "`which brew`" != "" ]; then
  BS=~/.bash_profile
fi

if grep -q bash_extra $BS; then
  echo "alrady configured";
else
  echo "# EXTRA CONFIGURATION" >> $BS;
  echo $EXTRA >> $BS;  
fi
