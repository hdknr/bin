#!/bin/bash

X=~/.bash_extra
mkdir -p $X;

EXTRA="
mkdir -p $X; 
touch $X/readme;
for sc  in $X/* ; do
  source \$sc ; 
done
";


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

[ -s "$X/default.bash" ] || ln -s ~/bin/env/default.bash  $X/0.default.bash
