# protonvpn-ufw

Script to enhance security whilst using ProtonVPN. Can be adapted to any VPN service, but this will use the available servers in accordance to the ProtonVPN.

This configuration is built and tested / being tested on Ubuntu 18.04.2 LTS.

The Linux for ProtonVPN can be referenced here: https://github.com/ProtonVPN.
Intent is for the user to use the script protonvpn-cli script and incorporate a ufw profile to harden the connection. Using an openVPN setting in network-manager should also work.
1. IPv6 totally disabled to prevent leaks
2. Local traffic allowed
3. All traffic to WAN forced through VPN or blocked
4. Default is all in and out denied

### Parts
1. /ufw/ - Solution using ufw gui - forcevpn script file should be placed in your local bin and files within /etc/ changed appropriately in their matching locations.
2. /proton/ - The function in ProtonVPN's cli script for the killswitch, which is currently disabled in the script.

### ProtonVPN Enter/Exit IPs
1. US-FREE#1 : 108.59.0.37
2. US-FREE#2 : 108.59.0.40
3. JP-FREE#1 : 185.161.200.10
4. JP-FREE#2 : 185.242.4.203
5. JP-FREE#3 : 193.148.16.227
6. NL-FREE#1 : 217.23.3.171
7. NL-FREE#2 : 217.23.3.91

### To do
1. Ideally this will be a more comprehensive script. Until then, the rules need to be set and tested
2. Need to further restrict by interface and port?

### Local Files of Interest
1. /etc/ufw/sysctl.conf
2. /etc/default/ufw
3. /etc/sysctl.conf
