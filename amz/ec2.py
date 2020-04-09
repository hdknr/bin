#!/usr/bin/env python
import click
import os
import sys
import boto3
import json
import requests

BIN = os.path.dirname(os.path.abspath(__file__))
BASE = os.path.dirname(BIN)
sys.path.insert(0, BASE)

from amzutils import setup, dump

@click.group()
@click.option('--settings', '-s', default=None)
@click.option('--profile_name', '-p', default=None)
@click.pass_context
def main(ctx, settings, profile_name):
    setup(ctx, settings, profile_name)


def vpcs(name=None):
    ec2 = boto3.client('ec2')
    args = name and dict(Filters=[{'Name': 'tag:Name', 'Values': [name]}]) or {}
    res = ec2.describe_vpcs(**args)
    return res.get('Vpcs', [])


def get_vpc(name):
    res = vpcs(name)
    if len(res) == 1:
        # https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/ec2.html#vpc
        ec2 = boto3.resource('ec2')
        return ec2.Vpc(res[0]['VpcId'])


def all_secgroups(name=None):
    vpc_ids = [i['VpcId'] for i in vpcs()]
    Filters=[dict(Name='vpc-id', Values=vpc_ids)]
    response = ec2.describe_security_groups(Filters=Filters)
    if name:
        return [
            i
            for i in response.get('SecurityGroups', [])
            if json.dumps(i).find(name) >=0
        ]

    return response.get('SecurityGroups', [])


@main.command()
@click.option('--name', '-n', default=None)
@click.pass_context
def desc_vpcs(ctx, name):
    # https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/ec2.html#EC2.Client.describe_vpcs 
    response = vpcs(name=name)
    dump(response)


@main.command()
@click.option('--group', '-g', default=None, help="Group Name")
@click.pass_context
def desc_ports(ctx, group):
    # https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/ec2.html#EC2.Client.describe_security_groups
    response = all_secgroups(name=group)
    for g in response:
        for p in g.get('IpPermissions', []):
            for r in p.get('IpRanges', []):
                description = r.get('Description', '')
                click.echo(
                    f"{g['VpcId']} {p['IpProtocol']}/{p['FromPort']} {r['CidrIp']} {description}"
                )

@main.command()
@click.argument('vpc')
@click.pass_context
def list_instances(ctx, vpc):
    # https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/ec2.html#EC2.Vpc.instances
    vpcobj = get_vpc(vpc)
    # <class 'boto3.resources.collection.ec2.Vpc.instancesCollection'>
    instances = vpcobj.instances.all()  # ec2.Vpc.instancesCollection
    for instance in instances:
        # boto3.resources.factory.ec2.Instance
        # https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/ec2.html#EC2.Instance
        dump(instance.tags)


def my_ipaddress():
    return requests.get('http://inet-ip.info/ip').text


def authorize_port(group_id, description, cidr, port, proto='tcp'):
    # https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/ec2.html#EC2.Client.authorize_security_group_ingress
    ec2 = boto3.client('ec2')
    ips = dict(
        CidrIp=cidr,
        Description=description,
    )
    perms = dict(
        IpProtocol=proto,
        FromPort=port,
        ToPort=port,
        IpRanges=[ips]
    )
    return ec2.authorize_security_group_ingress(
        GroupId=group_id, IpPermissions=[perms])


def revoke_port(group_id, cidr, port, proto='tcp'):
    # https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/ec2.html#EC2.SecurityGroup.revoke_ingress
    sg = boto3.resource('ec2').SecurityGroup(group_id) 
    return sg.revoke_ingress(
        CidrIp=cidr,
        IpProtocol=proto,
        FromPort=port,
        ToPort=port,
    )


@main.command()
@click.argument('port')
@click.argument('description')
@click.option('--group', '-g', default=None, help="Security Group Name(Name, tag:Name,)")
@click.option('--proto', '-p', default='tcp', help="Protocol(tcp|udp|...)")
@click.pass_context
def allow_myip(ctx, port, description, group, proto):
    ''' Allow *PORT* number for current computer network '''
    response = all_secgroups(name=group)
    group_ids = [i['GroupId'] for i in response]
    myip = my_ipaddress() 
    for gid in group_ids:
        click.echo(f"allowing {gid}: {proto}/{port} for {myip}")
        res = authorize_port(gid, description,  f"{myip}/32", int(port), proto)
        dump(res)


@main.command()
@click.argument('port')
@click.option('--group', '-g', default=None, help="Security Group Name(Name, tag:Name,)")
@click.option('--proto', '-p', default='tcp', help="Protocol(tcp|udp|...)")
@click.pass_context
def reject_myip(ctx, port, group, proto):
    response = all_secgroups(name=group)
    group_ids = [i['GroupId'] for i in response]
    myip = my_ipaddress() 
    for gid in group_ids:
        click.echo(f"rejecting {gid}: {proto}/{port} for {myip}")
        res = revoke_port(gid, f"{myip}/33", int(port), proto)
        dump(res)


# TODO:
# https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/ec2.html#EC2.Client.associate_iam_instance_profile

if __name__ == '__main__':
    main(obj={})
