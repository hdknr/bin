#!/bin/bash
sudo timedatectl set-timezone Asia/Tokyo

sudo apt install language-pack-ja manpages-ja-dev -y
sudo localectl set-locale LANG=ja_JP.UTF-8 LANGUAGE=”jp_JP:ja”
sudo update-locale LANG=ja_JP.UTF-8 LANGUAGE=ja_JP.UTF-8
source /etc/default/locale