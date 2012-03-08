#!/bin/sh
DIST=`lsb_release -s -i`

case "$DIST" in
  "Ubuntu" | "Debian" ) AU=www-data ; AG=www-data;;
  *) AU=apache; AG=apache;;
esac

echo $DIST,$AU, $AG

if [ $# -ne 2 ]; then
  echo "ERROR:comand format like this:"
  echo svn.sh site project_name
  exit 1
fi
echo creating ... $1
mkdir -p $1/prj/$2
svnadmin create --fs-type fsfs $1/prj/$2/svn
chown -R $AU:$AG $1/prj/$2
chmod -R g+w $1/prj/$2/svn
