function SYS_UPDATE() {

if [ -n "$NTPSERVER" ] ;then
    ST="sudo ntpdate $NTPSERVER" ;
else
    ST="sudo ntpdate time.apple.com";
fi

if [ -n "`which apt-get`" ] ; then 
  $ST;
  sudo aptitude update ; 
  sudo aptitude safe-upgrade -y ;
elif [ -n "`which yum`" ] ; then
  $ST;
  sudo yum update -y ;
elif [ -n "`which brew`" ] ; then
  brew update;
fi

#
# bin/* 
pushd .
cd ~/bin/
git pull
popd 
}
