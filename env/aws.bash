function EC2_SSH_SOURCE()
{
    # SSH の許可されたIPアドレスを一覧
    aws ec2 describe-security-groups --group-ids $1 | jq ".[][0].IpPermissions" | jq "map(select(.FromPort == 22))" | jq ".[].IpRanges[].CidrIp" -r
}

function EC2_SSHIP_ALLOW()
{
    # https://docs.aws.amazon.com/cli/latest/reference/ec2/authorize-security-group-ingress.html
    MYIP=`curl -s ifconfig.me`
    aws ec2 authorize-security-group-ingress --group-id $1 --protocol tcp --port 22 --cidr $MYIP/32
}

function EC2_SSHIP_REVOKE()
{
    # https://docs.aws.amazon.com/cli/latest/reference/ec2/authorize-security-group-ingress.html
    MYIP=`curl -s ifconfig.me`
    aws ec2 revoke-security-group-ingress  --group-id $1 --protocol tcp --port 22 --cidr $MYIP/32
}
function EC2_SECGROUP_ID()
{
    # タグ名に一致したセキュリティグループIDを表示
    aws ec2 describe-security-groups --filters Name=tag-key,Values=Name Name=tag-value,Values=$1 | jq ".SecurityGroups[].GroupId" -r;
}