# protonvpn-ufw

Script to enhance security whilst using ProtonVPN free plan. Can be adapted to any VPN service, but this will use the available servers in accordance to the ProtonVPN free plan.

This configuration is built and tested / being tested on Ubuntu 18.04.2 LTS.

The Linux for ProtonVPN can be referenced here: https://github.com/ProtonVPN
Intent is for the user to use the script protonvpn-cli script and incorporate a ufw profile to harden the connection.
1. IPv6 totally disabled to prevent leaks
2. Local traffic allowed
3. All traffic to WAN forced through VPN or blocked
4. Default is all in and out denied

This should also be valid for users who wish to use the VPN connections for OpenVPN via network-manager.

forcevpn script file should be placed in your local bin and files within /etc/ changed appropriately in their matching locations.

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
3. Alternatives to using ufw
  a. shorewall
  b. iptables

### Local Files of Interest
1. /etc/ufw/sysctl.conf
2. /etc/default/ufw
3. /etc/sysctl.conf
