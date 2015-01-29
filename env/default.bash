set -o vi

function WEB()
{
   [ -n "$1" ] && PORT=$1 || PORT="8000" ;
   python -m SimpleHTTPServer $PORT;
}
