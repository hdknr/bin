#!/bin/bash
P=`dirname $0`
source  `dirname $P`/Linux/dist.sh
#
SRC=http://code.hdknr.com/apache
#
if [ -z $1 ]; then 
   echo "ERROR:comand format like this:" 
   echo ~/bin/mksite.sh %DOMAIN_NAME% %DIRECTORYNAME%
   exit 1 
fi 
#
BASE=`pwd`
#
CNAME=$1
DIR=$1
if [ ! -z $2 ] ; then
    DIR=$2
fi
echo "creating $DIR  directory for $CNAME"
#
sudo mkdir -p $DIR/www $DIR/logs $DIR/conf
curl $SRC/conf/index.html | sed "s/DOMAIN_NAME/$CNAME/g" | sudo tee  $DIR/www/index.html 
#
HTTP=/etc/$APACHE
SITE_CONF=$BASE/$DIR/conf/httpd.conf
case $DIST in 
  'Debian') SITE_ENABLED=$HTTP/sites-enabled/$CNAME.conf;;
  'Ubuntu') SITE_ENABLED=$HTTP/sites-enabled/$CNAME.conf;;
  'CentOS') SITE_ENABLED=$HTTP/conf.d/$CNAME.conf;;
esac


SITE_CONF_D=$SITE_CONF.d
#
curl $SRC/conf/site.conf.http |  sed -e "s/DOMAIN_NAME/$CNAME/g" | sed -e "s/DIR_NAME/$DIR/g" | sed -e "s@BASE_DIR@$BASE@g" | sudo tee $SITE_CONF
sudo ln -fs $SITE_CONF $SITE_ENABLED
#sudo touch $SITE_CONF_D/wsgi.def
#
sudo mkdir -p $SITE_CONF_D
#
sudo chown -R $APACHE_USER:$APACHE_USER $DIR
