function wiki() {
    w3m http://trac.hdknr.com/wiki/$1 ; 
}
function tma(){
    echo "tmux a -t $1";
    tmux a -t $1;
}
function tmls(){
    echo "tmux list-sessions";
    tmux ls;
}

function tmn(){
    echo "tmux new  -s $1 ";
    tmux  new -s $1;
}

function tve(){
    SN=$1
    VE=$2
    
    if [ "$SN" != "" -a "$VE" != "" ] ; then
        # New Session
        tmux new-session -s "$SN" -d
        
        # 6 Windows
        for i in {1..6}; do
          echo "tmux new-window -t $SN:$i -n win$i"; 
          tmux new-window -d -k -t "$SN:$i" -n "win$i" 
          tmux send -t "$SN:$i"  "workon $VE" ENTER cdvirtualenv ENTER "cd src" ENTER;
        done
        
        # アタッチ
        tmux attach-session -t "$SN"
    fi
}

function X509(){
    echo "q" | openssl s_client -showcerts -connect $1:443 2>/dev/null | openssl x509 -noout -text
}
