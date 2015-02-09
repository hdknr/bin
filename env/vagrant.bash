function VAGRANT_SCP()
{
  echo "#Guest destination may be vagrant@default";
  CONF=ssh.conf
  [ -f "$CONF" ] || vagrant ssh-config >  $CONF;
  scp -F $CONF "$@";
}
