#!/bin/bash

###############################
# Prerequisite installation - Apache & PHP

sudo apt update 
sudo apt install apache2
sudo ufw app list
sudo ufw app info "Apache Full"
sudo ufw allow "Apache Full"

sudo apt install php libapache2-mod-php php-mysql
sudo systemctl restart apache2

###############################
# Nagios Core installation
# Download latest version - check latest available version at
# https://www.nagios.org/downloads/nagios-core/thanks/?skip=1

sudo useradd nagios
sudo apt update
sudo apt install autoconf gcc make unzip libgd-dev libmcrypt-dev libssl-dev dc snmp libnet-snmp-perl gettext

cd ~
curl -L -O https://github.com/NagiosEnterprises/nagioscore/archive/nagios-4.4.12.tar.gz
tar zxf nagios-4.4.12.tar.gz
cd nagioscore-nagios-4.4.12

./configure --with-httpd-conf=/etc/apache2/sites-enabled
make all

sudo make install-groups-users
sudo make install
sudo make install-daemoninit
sudo make install-commandmode
sudo make install-config
sudo make install-webconf

sudo a2enmod rewrite
sudo a2enmod cgi
sudo usermod -a -G nagios www-data

###############################
# Nagios Plug-ins Installation
# Check the latest plug-in version at - https://nagios-plugins.org/

cd ~
curl -L -O https://nagios-plugins.org/download/nagios-plugins-2.4.4.tar.gz
tar zxf nagios-plugins-2.4.4.tar.gz
cd nagios-plugins-2.4.4
./configure
make
sudo make install

###############################
# NRPE Plug-in Installation
# Check the latest plugin version at:
# https://github.com/NagiosEnterprises/nrpe/releases

cd ~
curl -L -O https://github.com/NagiosEnterprises/nrpe/releases/download/nrpe-4.1.0/nrpe-4.1.0.tar.gz
tar zxf nrpe-4.1.0.tar.gz
cd nrpe-4.1.0
./configure
make check_nrpe
sudo make install-plugin

# Run below commands manually
# sudo htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin
# sudo systemctl restart apache2
