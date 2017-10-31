#!/bin/bash
sudo apt-get install language-pack-ja -y
sudo timedatectl set-timezone Asia/Tokyo
sudo update-locale LANG=ja_JP.UTF-8
