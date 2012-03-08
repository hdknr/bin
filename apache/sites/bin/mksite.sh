#!/bin/sh
APACHE=httpd
if [ -f /etc/debian_version ] ; then
  APACHE=apache2
fi
BASE=`pwd`
#
BINPATH=`dirname $0`
#
if [ $# -ne 1 ]; then 
   echo "ERROR:comand format like this:" 
   echo bin/sitemake.sh %DOMAIN_NAME%
   exit 1 
fi 
#
mkdir -p $1
mkdir -p $1/www
sed "s/DOMAIN_NAME/$1/g" $BINPATH/mksite/index.html > $1/www/index.html 
mkdir -p $1/logs
mkdir -p $1/conf
#
HTTP=/etc/$APACHE
SITE_CONF=$BASE/$1/conf/httpd.conf
SITE_ENABLED=$HTTP/sites-enabled/$1.conf
SITE_CONF_D=$SITE_CONF.d
#
sed -e "s/DOMAIN_NAME/$1/g" $BINPATH/mksite/site.conf.http | sed -e "s@BASE_DIR@$BASE@g"  > $SITE_CONF
ln -fs $SITE_CONF $SITE_ENABLED
#
mkdir -p $SITE_CONF_D
#
#for i in $BINPATH/site.conf.d/* ; do 
#   sed "s/DOMAIN_NAME/$1/g" $i > $SITE_CONF_D/`basename $i`
#done
#
chown -R www-data:www-data $1
