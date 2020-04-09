# Vagrant
function VG-SUSPEND {
   # Suspend all instances
   vagrant global-status | grep running | while read STATUS  ;do
      ARGS=( ${(z)STATUS} )
      vagrant suspend ${ARGS[1]};
   done
}
