SSL_CERTS_SAN (){
    echo|openssl s_client -connect $1:443 -servername $1 -showcerts | openssl x509 -noout -text | grep "Subject Alternative Name" -A2 | grep -Eo "DNS:[a-zA-Z 0-9.*-]*" |  sed "s/DNS://g" 
}