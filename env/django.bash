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
