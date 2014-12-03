export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"

function cdvirtualenv()
{
  cd $VIRTUAL_ENV;
}
