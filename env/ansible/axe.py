#!/usr/bin/env python
from ansible.inventory.ini import InventoryParser
import os
from pycommand.command import Command, SubCommand
import itertools
#

_SSH = 'ssh {key} {user}{host}'
_CHECK_SESSION = "tmux has-session -t {session} 2> /dev/null "
_NEW_SESSION = "tmux new-session -d -s {session} '{ssh}'"
_NEW_WINDOW = "tmux new-window -t {session} '{ssh}'"
_ATTACH_SESSION = "tmux attach-session -t {session}"


def get_hosts(group='all', session=None, hostfile='hosts'):
    ''' return list of Host objects
    '''
    session = session or os.path.basename(os.path.abspath('.'))

    parser = InventoryParser(hostfile)

    ssh_hosts = parser.groups[group] and parser.groups[group].hosts
    if not ssh_hosts:
        ssh_hosts = list(
            itertools.chain.from_iterable(
                [v.hosts for k, v in parser.groups.items()]))

    return ssh_hosts


def get_ssh(host):
    ''' host: Host object '''
    key = host.vars.get('ansible_ssh_private_key_file', '')
    user = host.vars.get('ansible_ssh_user', '')
    return _SSH.format(
        key=key and '-i ' + key or '',
        user=user and user + '@' or '',
        host=host.name,
    )


def tmux_format():
    yield " ".join(
        [_CHECK_SESSION, "&&", _NEW_WINDOW, '||', _NEW_SESSION, ])
    while True:
        yield _NEW_WINDOW


def tmux_command(group='all', hosts=[], session=None, hostfile='hosts'):

    tmux = tmux_format()

    commands = []
    for host in get_hosts(group, session, hostfile):
        if hosts and host.name not in hosts:
            continue
        ssh = get_ssh(host)
        commands.append(tmux.next().format(
            session=session, ssh=ssh,))

    if len(commands) > 0:
        commands.append(_ATTACH_SESSION.format(session=session))
    return commands


class AnsibleCommand(Command):

    class TmuxCommand(SubCommand):
        name = "tmux"
        description = "Open tmux windows with ssh connection"
        args = [
            (('hosts',), dict(nargs='*', help="Hosts")),
            (('--group',),
             dict(nargs='?', help="Host Group", default="all"),),
            (('--file',),
             dict(nargs='?', default="hosts",
                  help="Host File(default=./hosts)",),),
        ]

        def run(self, params, **options):
            print ";\n".join(
                tmux_command(params.group, params.hosts))

    class SshCommand(SubCommand):
        name = "ssh"
        description = "Open tmux windows with ssh connection"
        args = [
            (('hosts',), dict(nargs=1, help="Hosts")),
            (('--group',),
             dict(nargs='?', help="Host Group", default="all"),),
            (('--file',),
             dict(nargs='?', default="hosts",
                  help="Host File(default=./hosts)",),),
        ]

        def run(self, params, **options):
            for host in get_hosts(params.group):
                if host.name in params.hosts:
                    print get_ssh(host)
                    break

if __name__ == '__main__':
        AnsibleCommand().run()
