#!/bin/bash
# conf.fab.dist をコピーしてクレデンシャル情報を設定する
function fabs() {
  CONF=.credentials.fab
  #
  if [ "$1" == ssh ]; then
     while IFS='=' read -r k v; do eval "$k=$v"; done < $CONF
     ssh -i $key_filename $user@$hosts
  else
     fab -c $CONF $@ 
  fi
}
