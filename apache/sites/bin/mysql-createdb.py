#!/usr/bin/python
# provide 
#  1.mysql-createdb.sh script
#  2. SITE_DIR/conf/mysqlroot.sh script which EXPORTs MySQL root password
#
import os
import sys
import commands

DB_CONF="db.conf.sh"
SITE_DIR=os.path.dirname(os.path.abspath(os.path.dirname(__file__)))

def create_database(opts):
    arg=["/%s/bin/%s" % (SITE_DIR,os.path.basename(__file__).replace('py','sh')),
         "/%s/%s/mysql/%s/%s"% (SITE_DIR,opts.site,opts.dbname,DB_CONF),
         "/%s/conf/mysqlroot.sh" % (SITE_DIR)]
    print commands.getoutput( ' '.join(arg) )

def make_identity(opts):
    print  "DBNAME=",opts.dbname
    print  "DBUSER=",opts.dbuser
    print  "DBPASS=",opts.dbpass
    p =  "/%s/%s/mysql/%s"% (SITE_DIR,opts.site,opts.dbname )
    print commands.getoutput("mkdir -p "+p )
    f= open(p+"/"+DB_CONF , "wr")
    f.write("export DB_NAME=%s\n" % opts.dbname )
    f.write("export DB_USER=%s\n" % opts.dbuser )
    f.write("export DB_PASS=%s\n" % opts.dbpass )
   
if __name__ == '__main__':
    import optparse
    parser = optparse.OptionParser(usage="%prog MySQL ", version="%prog 1.0")
    parser.add_option("-s" , dest="site"  )
    parser.add_option("-d" , dest="dbname"  )
    parser.add_option("-u" , dest="dbuser"  )
    parser.add_option("-p" , dest="dbpass"  )
    (opts,args) = parser.parse_args() 

    if None == opts.site:
        print "-s site MUST be specified"
        exit(0)

    if None == opts.dbname:
        print "-d database_name MUST be specified"
        exit(0)

    if None == opts.dbuser:
        opts.dbuser = opts.dbname

    if None == opts.dbpass:
        opts.dbpass = opts.dbuser


    print str(type(opts))

    make_identity(opts)
    create_database(opts)       
