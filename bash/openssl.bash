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
