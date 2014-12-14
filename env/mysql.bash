MYSQL_CREATE_DB()
{
    if [ "$DBROOT_USER" == "" ] ;then 
        echo "configure ~/.bash_extra/conf.bash to define DBROOT_USER & _PASSWD" ; 
        return 2>&- || exit;
        
    fi
    if [ "$1" == "" ] ; then
        echo "Specify Database Name" ; 
        return 2>&- || exit;
    fi
    DB=$1;
    US=$DB;
    PW=$DB;
    if [ "$2" != "" ] ; then US=$2;PW=$2; fi;
    if [ "$3" != "" ] ; then PW=$3 ; fi;

    echo $DB, $US, $PW
    echo "CREATE DATABASE $DB DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;"
    echo "CREATE DATABASE $DB DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;" | mysql -u $DBROOT_USER --password=$DBROOT_PASSWD
    echo "GRANT ALL on $DB.* to $US@% identified by $PW WITH GRANT OPTION;"
    echo "GRANT ALL on $DB.* to '$US'@'localhost' identified by '$PW' WITH GRANT OPTION;"| mysql -u $DBROOT_USER --password=$DBROOT_PASSWD
    
}

MYSQL_DROP_DB()
{
    if [ "$1" != "" ] ;then
        echo "drop database $1" | mysql  -u $DBROOT_USER --password=$DBROOT_PASSWD
    fi
}
MYSQL_SHOW_DATABASESE()
{
 echo "show databases" | mysql  -u $DBROOT_USER --password=$DBROOT_PASSWD
}


MYSQL_DUMP_DDL()
{
OPT=(
"-d"
)
    CMD="mysqldump -u $DBROOT_USER --password=$DBROOT_PASSWD ${OPT[@]} $1 $2";
    $CMD;
}

MYSQL_DUMP_PROCEDURES()
{
OPT=(
"--routines"
"--no-create-info"
"--no-data"
"--no-create-db"
"--skip-opt"
)
    CMD="mysqldump -u $DBROOT_USER --password=$DBROOT_PASSWD ${OPT[@]} $1";
    $CMD;
}

MYSQL_DUMP_DATA()
{

#: --skip-extended-insert  : line by line
#: -c : full column names 
#: -t : no DDL

OPT=(
"--skip-extended-insert"
"-c"
"-t"
)
    CMD="mysqldump -u $DBROOT_USER --password=$DBROOT_PASSWD ${OPT[@]} $1 $2";
    $CMD;
}

MYSQL_DUMP_ALL()
{
    MYSQL_DUMP_DDL $1 $2;
    MYSQL_DUMP_DATA $1 $2;
}
