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

BS=~/.bashrc

if grep -q bash_extra $BS; then
  echo "alrady configured";
else
  echo "# EXTRA CONFIGURATION" >> $BS;
  echo $EXTRA >> $BS;  
fi

[ -s "$X/0.default.bash" ] || ln -s ~/bin/env/default.bash  $X/0.default.bash
