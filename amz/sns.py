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


def all_topics():
    client = boto3.client('sns')
    return client.list_topics()

@main.command()
@click.pass_context
def list_topics(ctx):
    # https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/sns.html#SNS.Client.list_topics
    res = all_topics()
    dump(res)

@main.command()
@click.argument('topic')
@click.argument('message')
@click.option('--subject', '-s', default=None)
@click.pass_context
def publish(ctx, topic, message, subject):
    # https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/sns.html#SNS.Client.publish
    client = boto3.client('sns')
    body = {'Message': message}
    if subject:
        body['Subject'] = subject 

    res = all_topics()

    for t in res['Topics']: 
        arn = t.get('TopicArn', '')
        if arn.find(topic) >= 0:
            body['TopicArn']  = arn
            dump(body)
            res = client.publish(**body)
            dump(res)

if __name__ == '__main__':
    main(obj={})
