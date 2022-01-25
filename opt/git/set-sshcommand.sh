#!/bin/bash
# .gitignore
#   .secrets


KEY=$1
FILE=$(basename $1)
DIR=.secrets
#
mkdir -p $DIR
cp $KEY $DIR/$FINE
#
cat > $DIR/ssh.conf << EOS
Host github.com
    HostName github.com
    Port 22
    User git
    IdentityFile .secrets/$FILE
EOS
#
chmod 600 $DIR/ssh.conf
git config core.sshCommand "ssh -F .secrets/ssh.conf"
