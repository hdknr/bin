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

function ANSIBLE_SSH()
{
  eval "`~/bin/env/ansible/axe.py ssh $@`";
}

function ANSIBLE_TMUX()
{
  eval "`~/bin/env/ansible/axe.py tmux $@`";
}
