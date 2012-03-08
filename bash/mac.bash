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

function Address()
{
    /Applications/Address\ Book.app/Contents/MacOS/Address\ Book
}

function FF()
{
    /Applications/Firefox.app/Contents/MacOS/firefox-bin -ProfileManager
}
