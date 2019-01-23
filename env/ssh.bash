# ssh.conf in current folder
function OPEN_SSH()
{
  PARAMS="$@"; [ -n "$PARAMS" ] || PARAMS="default";
  if [ -f ssh.conf ]; then
    # macOS
    SCRIPT="pushd .;cd $PWD;$SUDO ssh -F ssh.conf $PARAMS; popd"; 
    AS="osascript -e 'tell application \"Terminal\" to do script \"$SCRIPT\"'";
    eval $AS;
  fi
}

function SCP()
{
  PARAMS="$@"; [ -n "$PARAMS" ] || PARAMS="default";
  if [ -f ssh.conf ]; then
    echo "scp -F ssh.conf $PARAMS"; 
    scp -F ssh.conf $PARAMS; 
  fi
}


# # HUB_HOST=
# # HUB_KEY=
# # HUB_USER=
# 
# export TUNNEL_OFFICE=3333
# export TO_OFFCIE=4444 
# export TUNNEL_HOME=5555
# export TO_HOME=6666
# 
# function WaitInOffice()
# {
# ssh -i $HUB_KEY  -N -f -g -R $TUNNEL_OFFICE:localhost:22 $HUB_USER@$HUB_HOST
# }
# function WaitInHome()
# {
# ssh -i $HUB_KEY  -N -f -g -R $TUNNEL_HOME:localhost:22 $HUB_USER@$HUB_HOST
# }
# 
# function BindToOffcie()
# {
# ssh -i $HUB_KEY  -N -f -g -L $TO_OFFICE:localhost:$TUNNEL_OFFICE $HUB_USER@$HUB_HOST
# }
# function BindToHome()
# {
# ssh -i $HUB_KEY  -N -f -g -L $TO_HOME:localhost:$TUNNEL_HOME $HUB_USER@$HUB_HOST
# }
# 
# function SshOffice()
# {
# ssh -p $TO_OFFICE  localhost 
# }
# 
# function SshHome()
# {
# ssh -p $TO_HOME localhost 
# }
# 
# function SshHub()
# {
# ssh -i $HUB_KEY  $HUB_USER@$HUB_HOST
# }
# 