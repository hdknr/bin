import cuisine
from fabric.api import env,run

REPO='https://raw.github.com/hdknr/bin'
BRANCH="master"
URL=lambda path : "%s/%s%s" % ( REPO,BRANCH,path)

def _install_deb_packages(path):
    url =URL(path)
    command = "curl %s | while read p ;do sudo aptitude install $p -y ;done" % url
    cuisine.run( command  )

def _run( command ):
    with open('run.log','w') as log: 
        log.write( cuisine.run( command ) )
####

def update_system():
    _run( "sudo apt-get update && sudo apt-get upgrade" )
    
def uptime():
    cuisine.run('uptime')     

def deb_packages():
    with open('out.log','w') as out:
        out.write(  
            cuisine.run('sudo dpkg --get-selections') )

def install_packages():
    _install_deb_packages('/fabric/res/ubuntu.packages.list' )

def clone_packages():
    # do localaly : dpkg --get-selections | grep -vi kernel > packages.list
    # copy to remote    : put('packages.list','$HOME/packages.list')
    # install   : 
    #   cuisine.run('sudo dpkg --set-selections < $HOME/packages.list && sudo dselect')
    pass     

def install_rbenv():
#    _install_deb_packages('/fabric/res/ubuntu.packages.rbenv.list' )
    _run("sudo apt-get install rbenv")
    

def install_bin():
    _run("git clone https://github.com/hdknr/bin.git")

def update_bin():
    _run("cd bin && git pull")
