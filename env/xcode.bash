function XCODE_LISTUDID()
{
    # https://github.com/duttski/listudids/blob/master/listudids
    GREP_OPTIONS=;
    FILE=$1
    for provisionFile in $( unzip -l "$FILE" | grep embedded.mobileprovision | awk '{$1=$2=$3=""; print $0}' | sed "s/^[ \t]*//" ); do
        unzip -p $FILE $provisionFile | security cms -D | python -c "import plistlib as p, sys as s; print '\n'.join(p.readPlist(s.stdin)['ProvisionedDevices']);";
    done
}
