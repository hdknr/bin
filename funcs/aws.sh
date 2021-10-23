AWS_UNUSED_SG() {
  aws ec2 describe-security-groups --query 'SecurityGroups[].[GroupId, GroupName]' --output text --profile $1 > /tmp/sg.txt
  aws ec2 describe-network-interfaces --query 'NetworkInterfaces[].[Groups]' --output text --profile $1 >> /tmp/sg.txt
  sort /tmp/sg.txt | uniq -u
}
