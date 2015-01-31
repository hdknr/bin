#!/usr/bin/env python
from ansible.inventory.ini import InventoryParser
import os
from pycommand.command import Command, SubCommand
import itertools
#

_CHECK_SESSION = "tmux has-session -t {session} 2> /dev/null "
_NEW_SESSION = "tmux new-session -d -s {session} '{ssh}'"
_NEW_WINDOW = "tmux new-window -t {session} '{ssh}'"
_ATTACH_SESSION = "tmux attach-session -t {session}"


def tmux_format():
    yield " ".join(
        [_CHECK_SESSION, "&&", _NEW_WINDOW, '||', _NEW_SESSION, ])
    while True:
        yield _NEW_WINDOW


def tmux_command(group='all', hosts=[], session=None, hostfile='hosts'):
    session = session or os.path.basename(os.path.abspath('.'))

    tmux = tmux_format()

    parser = InventoryParser(hostfile)

    targets = parser.groups[group] and parser.groups[group].hosts
    if not targets:
        targets = list(
            itertools.chain.from_iterable(
                [v.hosts for k, v in parser.groups.items()]))

    commands = []
    for host in targets:
        if hosts and host.name not in hosts:
            continue
        key = host.vars.get('ansible_ssh_private_key_file', '')
        user = host.vars.get('ansible_ssh_user', '')
        ssh = 'ssh {key} {user}{host}'.format(
            key=key and '-i ' + key or '',
            user=user and user + '@' or '',
            host=host.name,
        )
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


if __name__ == '__main__':
        AnsibleCommand().run()
