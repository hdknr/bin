BASE="$HOME"
ANYENV="$BASE/.anyenv/bin"
#
if [ "$(which anyenv)" == "$ANYENV/anyenv" ]; then
  echo already there.
else
  export PATH="$ANYENV:$PATH";
fi

eval "$(anyenv init -)"
eval "$(pyenv virtualenv-init -)"

for D in `\ls $BASE/.anyenv/envs`; do
    export PATH="$BASE/.anyenv/envs/$D/shims:$PATH"
done


function SCP()
{
  PARAMS="$@"; [ -n "$PARAMS" ] || PARAMS="default";
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

function DJ()
{
    PARAMS="$@"; [ -n "$PARAMS" ] || PARAMS="shell";
    C=$PWD;
    while [ "$C" != / ]; do
        [ -f "$C/manage.py" ] && { python $C/manage.py $PARAMS ; break; };
        C=`dirname $C`
    done;
}
