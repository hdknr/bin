function ANSIBLE_PLAYBOOK_DEBINIT()
{
    YML=debinit.yml
    if [ ! -f $YML ] ; then
        wget -O $YML https://gist.githubusercontent.com/hdknr/25b5beaceb896bf11a7b/raw/0efd69be7fb5e85e69f70c32dc37f9a11187efd2/debinit.yml
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


