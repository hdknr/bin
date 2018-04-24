function EC2_SSH_SOURCE()
{
aws --profile $1 ec2 describe-security-groups --group-ids $2 | jq ".[][0].IpPermissions" | jq "map(select(.FromPort == 22))" | jq ".[].IpRanges[].CidrIp"
}
