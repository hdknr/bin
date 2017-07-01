#!/bin/bash
declare -A PJ

function inArray # ( keyOrValue, arrayKeysOrValues ) 
{
  local e
  for e in "${@:2}"; do 
    [[ "$e" == "$1" ]] && return 0; 
  done
  return 1
}

function cdpj_reload(){
  if [ -d ~/.bash_extra/cdpj ] ; then
    for i in $(find ~/.bash_extra/cdpj/ -type l -exec basename {} \;); do
      PJ["$i"]=$(readlink  ~/.bash_extra/cdpj/$i);
    done
  fi
}

function cdpj_clear(){
  rm -rf ~/.bash_extra/cdpj
}

function cdpj_add(){
  [[ ! -d ~/.bash_extra/cdpj ]] && mkdir -p ~/.bash_extra/cdpj 
  [[ "$1" != "" && "$2" != "" ]] && ln -s $1 ~/.bash_extra/cdpj/$2
  cdpj_reload
}

function cdpj_remove(){
  [[ "$1" != "" ]] && unlink -s ~/.bash_extra/cdpj/$1
}

function cdpj(){
  if inArray $1 ${!PJ[@]}; then
    cd ${PJ[$1]}
  else
    echo "Projects not found: ${!PJ[@]}"
  fi
}

cdpj_reload

_cdpj()
{
    local pj; pj=${!PJ[@]};
    COMPREPLY=( $( compgen -W "$pj"  ${COMP_WORDS[COMP_CWORD]} ) )
}
complete -F _cdpj cdpj

