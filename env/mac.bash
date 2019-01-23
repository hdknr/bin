function CDF()
{
    cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')";
}

function CLEAN()
{
  if [ `uname` = "Darwin" ] ; then
    echo "Mac OSX";
    sudo killall Mail
    sudo killall firefox-bin
    sudo killall iCal
    sudo killall Preview
    sudo killall soffice
    sudo killall Google\ Chrome
  fi
}

VBMOUNT()
{
# $1 VirtualBox instance hostname in /etc/hosts
if [ ! -d $1 ]; then
   # create directory
   mkdir ~/Desktop/$1
fi
mount_smbfs //hdknr@$1/hdknr  ~/Desktop/$1
}

function Address()
{
    /Applications/Address\ Book.app/Contents/MacOS/Address\ Book
}

function FF()
{
    /Applications/Firefox.app/Contents/MacOS/firefox-bin -ProfileManager
}
function GVIM()
{
    /Applications/MacVim.app/Contents/MacOS/Vim -g -f
}

function RST()
{
  if [ -n "$1" ] ; then
    [ -f "style.css" ] && S="--stylesheet=style.css --syntax-highlight=short" || S="";
    #rst2html5 $1 $S > $1.html ; open $1.html;
    rst2html.py $1 $S > $1.html ; open $1.html;
  fi
}


function PDF_TO_PNG()
{
  # PDF をページごとにPNGにする
  gs -dNOPAUSE -sDEVICE=png16m -r256 -sOutputFile=$1.%03d.png $1;
}


function IME_RESET()
{
   # IME の残骸が残ったとき
   killall JapaneseIM
}
alias SW="xcrun --sdk iphonesimulator8.0 swift"
alias SWC="xcrun --sdk iphonesimulator8.0 swiftc"
export SELENIUM_SERVER_JAR=/usr/local/Cellar/selenium-server-standalone/2.53.1/libexec/selenium-server-standalone-2.53.1.jar

