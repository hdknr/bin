SOURCES=(
  funcs/zsh-completions.sh
  funcs/env.sh
  funcs/ssh.sh
  funcs/vagrant.sh
)

for i in $SOURCES; do
  if [ -f "$HOME/bin/$i" ]; then
    source "$HOME/bin/$i";
  fi
done
