import cuisine
from fabric.api import env,run

def uptime():
    cuisine.run('uptime')     


def deb_packages():
    with open('out.log','w') as out:
        out.write(  
            cuisine.run('sudo dpkg --get-selections') )

def install_packages():
    url = 'https://raw.github.com/hdknr/bin/master/fabric/res/ubuntu.packages.list'
    command = "curl %s | while read p ;do sudo aptitude install $p -y ;done" % url
    cuisine.run( command  )

def clone_packages():
    # do localaly : dpkg --get-selections | grep -vi kernel > packages.list
    # copy to remote    : put('packages.list','$HOME/packages.list')
    # install   : 
    #   cuisine.run('sudo dpkg --set-selections < $HOME/packages.list && sudo dselect')
    pass     

