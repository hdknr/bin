# export AWS_DEFAULT_PROFILE="***AWS PROFILE NAME***"
# export DEFAULT_SECURYT_GROUP="***DEFAULT SECURITY GROUP****""

function EC2_SECGROUP_ID()
{
    # Print Security Group ID
    GROUP_ID=${1:-$DEFAULT_SECURYT_GROUP}
    aws ec2 describe-security-groups --filters Name=tag-key,Values=Name Name=tag-value,Values=$GROUP_ID | jq ".SecurityGroups[].GroupId" -r;
}
function EC2_SSH_SOURCE()
{
    # TCP22 address
    GROUP_ID=${1:-$(EC2_SECGROUP_ID)}
    aws ec2 describe-security-groups --group-ids $1 | jq ".[][0].IpPermissions" | jq "map(select(.FromPort == 22))" | jq ".[].IpRanges[].CidrIp" -r
}

function EC2_SSHIP_ALLOW()
{
    # https://docs.aws.amazon.com/cli/latest/reference/ec2/authorize-security-group-ingress.html
    MYIP=`curl -s ifconfig.me`
    GROUP_ID=${1:-$(EC2_SECGROUP_ID)}
    aws ec2 authorize-security-group-ingress --group-id $GROUP_ID --protocol tcp --port 22 --cidr $MYIP/32
}

function EC2_SSHIP_REVOKE()
{
    # https://docs.aws.amazon.com/cli/latest/reference/ec2/authorize-security-group-ingress.html
    MYIP=`curl -s ifconfig.me`
    GROUP_ID=${1:-$(EC2_SECGROUP_ID)}
    aws ec2 revoke-security-group-ingress  --group-id $GROUP_ID --protocol tcp --port 22 --cidr $MYIP/32
}