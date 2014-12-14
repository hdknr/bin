function DIST_PRINT(){

if [ ! -z "`which lsb_release`" ] ; then
    export DIST=`lsb_release -s -i`
else [ -f /etc/debian_version ]  
    export DIST='Debian'
fi
#
case $DIST in 
  'Debian') export APACHE_USER=www-data ; APACHE=apache2;;
  'Ubuntu') export APACHE_USER=www-data ; APACHE=apache2;;
  'CentOS') export APACHE_USER=apache   ; APACHE=httpd;;
esac

echo "Distribution is $DIST."
echo "Apache is $APACHE(USER=$APACHE_USER)."
}
