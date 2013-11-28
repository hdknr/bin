#!/bin/bash
#
while IFS='=' read -r k v; do
  eval "$k=$v";
done < $1
#
if [ -d "$2" ]; then
  scp -i $key_filename $2  $user@$hosts: 
elif [ -f "$2" ] ;  then
  scp -i $key_filename -r  $2  $user@$hosts: 
fi
