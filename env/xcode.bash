function XCODE_LISTUDID()
{
CODE="
from plistlib import readPlist;
from sys import stdin;
print '\n'.join(readPlist(stdin)['ProvisionedDevices']);
"
IPA=$1
exml=$(unzip -Z1 $IPA | GREP_OPTIONS= grep mobileprovision)
unzip -p $IPA ${exml[0]} | security cms -D | python -c "$CODE"
}
