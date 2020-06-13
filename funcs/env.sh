BASE="$HOME"

if [ -f "$BASE/.anyenv/bin/anyenv" ]; then
  ANYENV="$BASE/.anyenv/bin:"
else
  ANYENV=""
fi
     

if [ -d "/usr/local" ]; then
  export PATH=${ANYENV}/usr/local/sbin:/usr/local/bin:$(getconf PATH);
else
  export PATH=${ANYENV}$(getconf PATH);
fi

eval "$(anyenv init -)";

anyenv envs | while read ENV; do
    eval "$(${ENV} init -)"
    case "$ENV" in 
      "pyenv" ) eval "$(pyenv virtualenv-init -)";;
    esac
done;

if [ -d "${GOPATH}/bin" ]; then
  export PATH=${GOPATH}/bin:${PATH}
fi
