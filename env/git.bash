# python .gitignore
function GIT_IGNORE_PYTHON()
{
   curl https://raw.githubusercontent.com/github/gitignore/master/Python.gitignore -o .gitignore
}

# 
function GIT_CONFIG_PASSWORD()
{
   git config credential.helper store
}
