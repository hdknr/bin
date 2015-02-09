function X509_FROM_HOST()
{
    # $1 Server Host
    echo "q" | openssl s_client -showcerts -connect $1:443 2>/dev/null 
} 
function X509_FROM_PEM()
{
    openssl x509 -noout -text -in $1
}

function X509_TO_DER()
{
    # expect stdio
    openssl x509  -outform DER
}

function X509_TO_PEM()
{
    # expect stdio
    openssl x509  -outform PEM
}

function X509_TO_TEXT(){
    # expect stdio
    openssl x509 -noout -text
}

function X509_DUMP_MD5()
{
    openssl x509 -md5 -noout -fingerprint 
}

function X509_DUMP_SHA1()
{
    openssl x509 -sha1 -noout -fingerprint
}

function X509_TO_PUBKEY_PEM()
{
    openssl x509 -pubkey  -noout
}

function X509_TO_PUBKEY_DER()
{
    openssl x509 -pubkey  -noout -outform DER
}

## PublicKey

function PUBKEY_FROM_PEM()
{
     openssl pkey -pubin -in $1
}
function PUBKEY_TO_TEXT()
{
     openssl pkey -pubin -text -noout
}

#####
function PKEY_MODULUS()
{
    openssl rsa -in $1  -modulus -noout
}
function PKEY_EXPONENT()
{
    openssl rsa -in $1  -modulus -noout
}
function PUBKEY_FROM_PKEY()
{
    openssl rsa -in $1  -out $1.pub -pubout
}


function PKEY_DUMP()
{
    openssl pkey -in $1 -text -noout
} 

function MKPKCS12()
{ 
    USAGE="MKPKCS12 key cert [output [ intermidiate ] ]";
    # $ openssl pkcs12 -export -in sample.crt -inkey sample.key -certfile sample.ca-bundle -out sample.pfx
    if [ $# -lt 2 ]; then
        echo $USAGE;
    fi
    KEY="-inkey $1";
    CRT="-in $2";
    if [ $# -gt 2 ]; then
        OUT="-out $3";
        if [ $# -gt 3 ]; then
            MID="-certfile $4";
        fi
    else
        OUT="-out ${1%.*}.pfx" ;
    fi
    openssl pkcs12 -export $CRT $KEY $MID $OUT
}

function KEYGEN()
{
    if [ "$1" != "" ] ; then
        # Filename
        OPT="-f $1" 
    fi
    ssh-keygen -t rsa -b 2048 $OPT
}
