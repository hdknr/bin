if [ -f "$HOME/.anyenv/bin/anyenv" ]; then
  ANYENV="$HOME/.anyenv/bin:"
else
  ANYENV=""
fi

if [ -d "/usr/local" ]; then
  export PATH=${ANYENV}/usr/local/sbin:/usr/local/bin:$(getconf PATH);
else
  export PATH=${ANYENV}$(getconf PATH);
fi

if [ ! -z "${ANYENV}" ]; then
  eval "$(anyenv init -)";
  anyenv envs | while read ENV; do
      case "$ENV" in 
        "pyenv" ) eval "$(pyenv init --path)";eval "$(pyenv virtualenv-init -)";;
        "*") eval "$(${ENV} init -)"
      esac
  done;
fi

if [ -d "${GOPATH}/bin" ]; then
  export PATH=${GOPATH}/bin:${PATH}
fi
