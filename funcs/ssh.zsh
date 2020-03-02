
function SCP()
{
  PARAMS="$@"; [ -n "$PARAMS" ] || PARAMS="default";
  echo $PARAMS
  C=$PWD/keys;
  while [ "$C" != / ]; do
    if [ -f "$C/ssh.conf" ]; then
      echo "scp -F $C/ssh.conf $PARAMS"; 
      scp -F $C/ssh.conf $PARAMS; 
      break;
    fi
    C=`dirname $C`
  done;
}

function RSYNC()
{
  PARAMS="$@"; [ -n "$PARAMS" ] || PARAMS="default";
  C=$PWD/keys;
  while [ "$C" != / ]; do
    if [ -f "$C/ssh.conf" ]; then
      rsync -e "ssh -F $C/ssh.conf" $PARAMS; 
      break;
    fi
    C=`dirname $C`
  done;
}

function OPEN_SSH()
{
  PARAMS="$@"; [ -n "$PARAMS" ] || PARAMS="default";
  C=$PWD/keys;
  while [ "$C" != / ]; do
    if [ -f "$C/ssh.conf" ]; then
      SCRIPT="pushd .;cd $PWD;$SUDO ssh -F $C/ssh.conf $PARAMS; popd"; 
      AS="osascript -e 'tell application \"Terminal\" to do script \"$SCRIPT\"'";
      eval $AS; 
      break;
    fi
    C=`dirname $C`
  done;
}

function DOWNLOAD()
{
  # $1: HOST, $2: Rmote Path, $3: Destination
  C=$PWD/keys;
  while [ "$C" != / ]; do
    if [ -f "$C/ssh.conf" ]; then
      ssh -F $C/ssh.conf $1 "sudo tar cvfz - $2" | tar xvfz - -C $3
    fi
    C=`dirname $C`
  done;
}


function SSH()
{
  PARAMS="$@"; [ -n "$PARAMS" ] || PARAMS="default";
  C=$PWD/keys;
  while [ "$C" != / ]; do
    if [ -f "$C/ssh.conf" ]; then
      ssh -F $C/ssh.conf $PARAMS;
      break;
    fi
    C=`dirname $C`
  done;
}
