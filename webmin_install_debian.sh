#!/bin/bash
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

echo ':: getting key and adding repository to the sources'
sh -c 'echo "deb http://download.webmin.com/download/repository sarge contrib" > /etc/apt/sources.list.d/webmin.list'
wget -O- http://www.webmin.com/jcameron-key.asc | apt-key add - || (echo 'Error downloading'; exit 2) 

echo ':: updating lists'
apt-get update || (echo 'Error downloading'; exit 2) 

echo ':: installing ...'
apt-get install webmin -fy

echo ':: done !'
echo '--------------------------'
echo 'go to https://<adress>:10000 in a browser and login with a user account that has sudo rights'
echo 'peace, love and Linux !'
