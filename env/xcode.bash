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

function XCODE_INFOPLIST()
{
CODE="
from plistlib import readPlist;
from sys import stdin;
from json import dumps
print dumps(readPlist(stdin))
"
IPA=$1
PLIST=$(unzip -Z1 $IPA | GREP_OPTIONS= grep Info.plist|head -n 1)
unzip -p $IPA $PLIST | plutil  -convert xml1 -o - - --  | python -c "$CODE"
}
