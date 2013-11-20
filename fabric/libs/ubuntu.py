import cuisine
from fabric.api import env,run

def uptime():
    cuisine.run('uptime')     


def deb_packages():
    with open('out.txt','w') as out:
        out.write(  
            cuisine.run('sudo dpkg --get-selections') )

def test():
    print "test"
