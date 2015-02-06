function DJ()
{
    PARAMS="$@"; [ -n "$PARAMS" ] || PARAMS="shell";
    C=$PWD;
    while [ "$C" != / ]; do
        [ -f "$C/manage.py" ] && { python $C/manage.py $PARAMS ; break; };
        C=`dirname $C`
    done;
}
