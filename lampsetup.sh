#!/bin/bash

# Script by Luke Bilston 
# Free to steal, modify and claim as your own!

# Last Update 9 DEC 14 

# update should be done as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi


# Required repository for webmin

if grep -Fxq "# Webmin Install" /etc/apt/sources.list
then
   echo "Webmin Already Installed"
else
   echo "# Webmin Install" >> /etc/apt/sources.list
   echo deb http://download.webmin.com/download/repository sarge contrib >> /etc/apt/sources.list
   echo deb http://webmin.mirror.somersettechsolutions.co.uk/repository sarge contrib >> /etc/apt/sources.list
   cd ~
   wget -q http://www.webmin.com/jcameron-key.asc jcameron-key.asc
   apt-key add jcameron-key.asc
fi


# Update to latest Version
apt-get update -y
apt-get dist-upgrade -y

# Time to Install
apt-get install -y ssh
apt-get install -y ntp ntpdate

apt-get install -y apache2 apache2-doc apache2-utils libapache2-mod-php5 
apt-get install -y php5 php5-common php5-gd php5-mysql php5-imap phpmyadmin php5-cli php5-cgi 
apt-get instasl -y libapache2-mod-fcgid apache2-suexec php-pear php-auth php5-mcrypt mcrypt 
apt-get install -y php5-imagick imagemagick libruby libapache2-mod-python php5-curl 
apt-get install -y php5-intl php5-memcache php5-memcached php5-ming php5-ps php5-pspell php5-recode php5-snmp 
apt-get install -y php5-sqlite php5-tidy php5-xmlrpc php5-xsl memcached snmp php5-ldap php5-gmp php-pear
apt-get install -y mysql-server mysql-client php5-mysql
apt-get install -y unzip
apt-get install -y webmin

a2enmod suexec rewrite 
php5enmod mcrypt

reboot


