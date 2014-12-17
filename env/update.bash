function SYS_UPDATE() {

if [ -n "$NTPSERVER" ] ;then
    sudo ntpdate $NTPSERVER ;
else
    sudo ntpdate time.apple.com
fi

if [ -n "`which apt-get`" ] ; then 
 sudo aptitude update ; 
 sudo aptitude safe-upgrade -y ;
fi 

if [ -n "`which yum`" ] ; then
  sudo yum update -y ;
fi


#
# bin/* 
pushd .
cd ~/bin/
git pull
popd 
}
