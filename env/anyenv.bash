export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

for D in `\ls $HOME/.anyenv/envs`; do
    export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
done

function ANYENV_PLUGIN()
{
    mkdir -p $(anyenv root)/plugins;
    git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update;
}

function ANYENV_PYENV_VIRTUALENV()
{
    git clone https://github.com/yyuu/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
}
