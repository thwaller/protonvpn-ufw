# vpn-control

Script to enhance security (aka killswitch) whilst using ProtonVPN on Ubuntu 18.04.2 LTS. Should work on most Linux systems and most VPN services.

The Linux for ProtonVPN can be referenced here: https://github.com/ProtonVPN. Intent is for the user to use the script protonvpn-cli script and incorporate a ufw profile to harden the connection. Using an OpenVPN setting in network-manager should also work.
1. IPv6 totally disabled to prevent leaks
2. Local traffic allowed
3. All traffic to WAN forced through VPN or blocked
4. Default is all in and out denied

### Parts
1. /ufw/ - Solution using ufw gui - forcevpn script file should be placed in your local bin and files within /etc/ changed appropriately in their matching locations.
2. /proton/ - The function in ProtonVPN's cli script for the killswitch, which is currently disabled in the script. This can be used as a guide, but also needs consideration should Proton enable it within the cli script.

### ProtonVPN Enter/Exit IPs
1. US-FREE#1 : 108.59.0.37
2. US-FREE#2 : 108.59.0.40
3. JP-FREE#1 : 185.161.200.10
4. JP-FREE#2 : 185.242.4.203
5. JP-FREE#3 : 193.148.16.227
6. NL-FREE#1 : 217.23.3.171
7. NL-FREE#2 : 217.23.3.91

### ProtonVPN considerations
1. protonvpn-cli has a killswitch function, although currently disabled.
2. protonvpn-cli has an ipv6 disabling function. Disabling ipv6 locally external of the script may not be necessary or desired.

### To do
1. Ideally this will be a more comprehensive script. Until then, the rules need to be set and tested
2. Need to further restrict by interface (wlan, eth, etc), protocol and port?

### Local files of interest for disabling IPv6
1. /etc/ufw/sysctl.conf
2. /etc/default/ufw
3. /etc/sysctl.conf
