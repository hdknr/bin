function SSL_X509(){
    echo "q" | openssl s_client -showcerts -connect $1:443 2>/dev/null | openssl x509 -noout -text
}

function X509DUMP()
{
    openssl x509 -noout -text -in $1
}

function X509FINGERPRINT()
{
    openssl x509 -md5 -noout -fingerprint -in $1
    openssl x509 -sha1 -noout -fingerprint -in $1
}

function X509_PUB_FROM_CERT()
{
    openssl x509 -pubkey  -inform PEM  -in  $1 -noout
}


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

function PUBKEY_DUMP()
{
    openssl  pkey -pubin -in $1 -text -noout
} 

function PKEY_DUMP()
{
    openssl  pkey -in $1 -text -noout
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
