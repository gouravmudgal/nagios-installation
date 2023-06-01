# nagios-installation
Nagios Installation shell scripts for Ubuntu OS.

There are 2 shell scripts for following purpose:
1. Server-side installation shell script (Nagios_Core_Plugin_NRPE_Installation_Server_VM.sh) for installing following Nagios components:
   - Prerequisites (Apache, PHP)
   - Nagios Core
   - Nagios Plugins
   - NRPE

2. Client-side installation shell script (NRPE_Plugin_Installation_Client_VM) for installation following Nagios components:
   - NRPE
   - Nagios Plugins

Note: You can directly run shell script on compatible OS, however I would recomment to use this schell script commands to be run manually for Nagios Server components. Also follow the Installation steps provided in Medium blog (https://medium.com/@gourav.mudgal/nagios-continuous-monitoring-tool-installation-configuration-7157a8692744).

This repository is just to help out someone who is willing to install Nagios server and client components. There are other monitoring tools also available and based on your needs you should decide which Monitoring tool suits to your needs.
