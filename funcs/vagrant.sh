alias V='vagrant'
alias VG='vagrant global-status'

VR() {
  vagrant resume `vagrant global-status |grep virtualbox | cut -f 1 -d " " | sed -n "$1,$1p"` 
}

VL() {
  vagrant reload `vagrant global-status |grep virtualbox | cut -f 1 -d " " | sed -n "$1,$1p"` 
}

VSSH() {
  vagrant ssh `vagrant global-status |grep virtualbox | cut -f 1 -d " " | sed -n "$1,$1p"` 
}
