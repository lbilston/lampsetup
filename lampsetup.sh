#!/bin/bash

# Script by Luke Bilston 
# Free to steal, modify and claim as your own!

# Last Update 9 DEC 14 

# update should be done as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Proxy Support
export http_proxy=http://10.130.48.19:8080

# Required repository for webmin
# echo deb http://download.webmin.com/download/repository sarge contrib >> /etc/apt/sources.list
# echo deb http://webmin.mirror.somersettechsolutions.co.uk/repository sarge contrib >> /etc/apt/sources.list

# Keys for Webmin
cd ~
wget -q http://www.webmin.com/jcameron-key.asc jcameron-key.asc
apt-key add jcameron-key.asc

# Update to latest Version
apt-get update -y
apt-get dist-upgrade -y

# Time to Install
apt-get install -y ssh
apt-get install -y apache2 php5 libapache2-mod-php5 
apt-get install -y mysql-server mysql-client php5-mysql
apt-get install -y unzip
apt-get install -y phpmyadmin
apt-get install -y webmin
apt-get install -y python python-setuptools python-virtualenv python-dev gcc swig dialog libaugeas0 libssl-dev
