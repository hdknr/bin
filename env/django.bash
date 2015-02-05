function DJ()
{
    C=$PWD;
    while [ "$C" != / ]; do
        [ -f "$C/manage.py" ] && { python $C/manage.py $@ ; break; };
        C=`dirname $C`
    done;
}
