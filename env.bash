BASE="$HOME"
ANYENV="$BASE/.anyenv/bin"
#
if [ "$(which anyenv)" == "" ]; then
  echo "anyenv initializing...";
  export PATH="$ANYENV:$PATH";
  eval "$(anyenv init -)";

  ## PATH
  anyenv envs | while read ENV; do
      eval "$(${ENV} init -)"
      case "$ENV" in 
        "pyenv" ) eval "$(pyenv virtualenv-init -)";;
      esac
  done;

fi

