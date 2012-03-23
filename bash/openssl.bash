function X509(){
    echo "q" | openssl s_client -showcerts -connect $1:443 2>/dev/null | openssl x509 -noout -text
}
