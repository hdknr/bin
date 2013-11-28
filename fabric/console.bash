#!/bin/bash
#
while IFS='=' read -r k v; do
  eval "$k=$v";
done < $1
#
ssh -i $key_filename $user@$hosts
