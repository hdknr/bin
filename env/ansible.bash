function ANSIBLE_PB()
{
  ansible-playbook ~/bin/env/ansible/$1.yml;
}

function ANSIBLE_OPEN_SSH()
{
    # -s : sudo 
    SUDO=''
    while getopts s OPT
    do
        case $OPT in
            s)  SUDO='sudo' ;;
        esac
    done
    shift $((OPTIND - 1))

  PARAMS="$@"; [ -n "$PARAMS" ] || PARAMS="default";
  if [ -f ssh.conf ]; then
    SCRIPT="cd $PWD;$SUDO ssh -F ssh.conf $PARAMS"; 
    AS="osascript -e 'tell application \"Terminal\" to do script \"$SCRIPT\"'";
    eval $AS;
    # osx
  else
    eval "`~/bin/env/ansible/axe.py ssh $PARAMS`";
  fi
}

function ANSIBLE_SSH()
{
  PARAMS="$@"; [ -n "$PARAMS" ] || PARAMS="default";

  if [ -f ssh.conf ]; then
    ssh -F ssh.conf $PARAMS; 
  else
    eval "`~/bin/env/ansible/axe.py ssh $PARAMS`";
  fi
}

function ANSIBLE_SCP()
{
  PARAMS="$@"; [ -n "$PARAMS" ] || PARAMS="default";

  if [ -f ssh.conf ]; then
    echo "scp -F ssh.conf $PARAMS"; 
    scp -F ssh.conf $PARAMS; 
  else
    eval "`~/bin/env/ansible/axe.py scp $PARAMS`";
  fi
}

function ANSIBLE_INIT()
{
  cat > ansible.cfg << EOF
[ssh_connection]
ssh_args = -F ssh.conf

[defaults]
hostfile = hosts
EOF

 cat > hosts << EOF
[server]
default
EOF

 cat > ssh.conf << EOF
Host default 
  HostName $(basename $PWD)
  User ${USER}
  Port 22
  UserKnownHostsFile /dev/null
  StrictHostKeyChecking no
  PasswordAuthentication no
  IdentityFile ~/.ssh/id_rsa 
  IdentitiesOnly yes
  LogLevel FATAL
EOF

}

function ANSIBLE_TMUX()
{
  eval "`~/bin/env/ansible/axe.py tmux $@`";
}

function ANSIBLE_PLAYBOOK_DEBINIT()
{
    source ~/bin/const.bash;
    YML=debinit.yml
    if [ ! -f $YML ] ; then
        wget -O $YML $BINGIT/env/ansible/debinit.yml
    fi;
    
    echo "## put the following code in Vagrant file.";
    echo "
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = '$YML'
    ansible.limit = 'all'
  end 
"
    echo "## and 'vagrant provision'";

}

