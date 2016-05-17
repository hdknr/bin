function XCODE_LISTUDID()
{
    # https://github.com/duttski/listudids/blob/master/listudids
    GREP_OPTIONS=;
    FILE=$1
    for provisionFile in $( unzip -l "$FILE" | grep embedded.mobileprovision | awk '{$1=$2=$3=""; print $0}' | sed "s/^[ \t]*//" ); do
        out=$(unzip -p $FILE $provisionFile | strings | awk '/ProvisionedDevices/,/\/array/'| grep string | sed 's/<[/]*string>//g' | sed 's/^/  /g');
        number=$(echo "$out" |grep \[A-Za-z0-9] | wc -l |xargs);
        printf "%s\n$s" $alludids $out;
    done

}
