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


function _tmux_list()
{   
    cur=$2
    if [ "$cur" != "" ] ; then
        COMPREPLY=( $( tmux ls | grep "^$cur" | cut -f3 -d:  )  )
    else
        COMPREPLY=( $( tmux ls  | cut -f1 -d:  )  )
    fi
}
complete -F _tmux_list tma
