function  USERADD(){
#   $1 : GID/UID
#   $2 : USERNAME
    if [ '0' == `grep -c ":$1:" /etc/passwd ` ] ; then
        echo "creaing user $2 for $1"; 
        sudo groupadd -g $1  $2;
        sudo useradd -g $2 -d /home/$2 -u $1 -m $2; 
    else
        echo "user exists"
    fi
}

function CPUS()
{
    echo "number of CPU"
    cat /proc/cpuinfo | grep processor | wc -l
}
