SOURCES=(
  funcs/zsh-completions.sh
)

for i in $SOURCES; do
  if [ -f "$HOME/bin/$i" ]; then
    source "$HOME/bin/$i";
  fi
done
