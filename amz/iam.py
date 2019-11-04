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

EC2_SERVICE_POLICY = '''
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "ec2.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}'''

@click.group()
@click.option('--settings', '-s', default=None)
@click.option('--profile_name', '-p', default=None)
@click.pass_context
def main(ctx, settings, profile_name):
    setup(ctx, settings, profile_name)

@main.command()
@click.pass_context
def list_roles(ctx):
    # https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/iam.html#IAM.Client.list_roles
    client = boto3.client('iam')
    res = client.list_roles()
    dump(res)


@main.command()
@click.argument('name')
@click.pass_context
def get_role(ctx, name):
    # https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/iam.html#IAM.Client.get_role
    res = boto3.client('iam').get_role(RoleName=name)
    dump(res)


@main.command()
@click.pass_context
def create_role_for_ec2(ctx, name):
    # https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/iam.html#IAM.Client.create_role
    res = boto3.client('iam').create_role(
        RoleName=name,
        AssumeRolePolicyDocument=EC2_SERVICE_POLICY,
    )
    dump(res)


if __name__ == '__main__':
    main(obj={})
