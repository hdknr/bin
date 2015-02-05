set -o vi
export BINGIT=https://raw.githubusercontent.com/hdknr/bin/master

function WEB()
{
   [ -n "$1" ] && PORT=$1 || PORT="8000" ;
   python -m SimpleHTTPServer $PORT;
}
