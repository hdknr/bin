# autocomplete
autoload -Uz compinit && compinit

# SET SSH KEY
GIT_SET_KEY (){
   export GIT_SSH_COMMAND="ssh -i $1"
}