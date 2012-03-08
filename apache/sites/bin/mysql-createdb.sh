#!/bin/bash
for arg in $* ; do
  if [ -f $arg ] ; then
    echo "sourcing $arg" ;
    source $arg;
fi;
done
echo "CREATE DATABASE $DB_NAME DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;" | mysql -u root --password=$MYSQL_PASSWORD
echo "GRANT ALL on $DB_NAME.* to '$DB_USER'@'localhost' identified by '$DB_PASS'" | mysql -u root --password=$MYSQL_PASSWORD
echo "show databases" | mysql -u root --password=$MYSQL_PASSWORD | grep $DB_NAME
echo "show tables" | mysql -u $DB_USER --password=$DB_PASS $DB_NAME

