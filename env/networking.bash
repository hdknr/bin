function NETWORK_RESTART()
{
    sudo ifconfig en0 down ; sudo ifconfig en0 up;
}
