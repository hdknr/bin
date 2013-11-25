Fabric tools
================


Provide Fabric configuration file in `*.fab`::

    $ cat myubuntu.fab

    fabfile=ubuntu.py
    hosts = 54.222.234.23
    user = ubuntu
    key_filename = /Users/hide/Documents/Amazon/MyEC2/linux.pem

Exec with -c option::

    $ fab -c myubuntu.fab deb_packages 
