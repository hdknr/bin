set -o vi
export BINGIT=https://raw.githubusercontent.com/hdknr/bin/master

function WEB()
{
   [ -n "$1" ] && PORT=$1 || PORT="8000" ;
   python -m SimpleHTTPServer $PORT;
}

function MD2RST()
{
  #Debian:
  #sudo apt-get install pandoc

  [ -n "$2" ] && DST=$2 || DST="."
  MDFILE=`basename $1`;
  pandoc -r markdown -w rst $1 -o $DST/${MDFILE%.*}.rst;
}
