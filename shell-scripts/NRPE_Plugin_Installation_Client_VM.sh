#!/bin/bash

###############################
# Nagios Plug-in Installation
# Check the latest plug-in version at - https://nagios-plugins.org/

sudo useradd nagios
sudo apt update
sudo apt install autoconf gcc libmcrypt-dev make libssl-dev wget dc build-essential gettext -y
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
make nrpe
sudo make install-daemon
sudo make install-config
sudo make install-init
