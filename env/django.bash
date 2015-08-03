function DJ()
{
    PARAMS="$@"; [ -n "$PARAMS" ] || PARAMS="shell";
    C=$PWD;
    while [ "$C" != / ]; do
        [ -f "$C/manage.py" ] && { python $C/manage.py $PARAMS ; break; };
        C=`dirname $C`
    done;
}

function DJMM()
{
    if [ -d migrations ]; then
        APP=${PWD##*/}; 
        DJ makemigrations $APP 
    fi    
}

function DJMG()
{
    if [ -d migrations ]; then
        APP=${PWD##*/}; 
        DJ migrate $APP 
    fi    
}

function DJDB()
{
    DJ dbshell $@;
}

function DJPV()
{
    C=$PWD;
    while [ "$C" != / ]; do
        [ -f "$C/pavement.py" ] && { paver -f $C/pavement.py $@; break; };
        C=`dirname $C`
    done;
}

function DJTEST()
{
    # pip install django-test-without-migrations
    # INSTALLED_APPS += ('test_without_migrations',)
    DJ test --nomigrations --keepdb $@
}
