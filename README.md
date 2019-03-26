# vpn-control

Script to enhance security (aka killswitch) whilst using ProtonVPN on Ubuntu 18.04.2 LTS. Should work on most Linux systems and most VPN services. Most VPN services include some sort of connection security, but many also prove to have leaks such as DNS and IPv6. When using OpenVPN with Linux, many VPNs do not come with a management application but rather just use settings that are manually entered into network-manager or a cli script to control. In addition to leaks, there is a security concern should the VPN connection drop as there is no visible indicator to show whether the VPN is on or off. So for additional security, should the VPN drop, so does the internet connectivity.

The Linux cli for ProtonVPN can be referenced here: https://github.com/ProtonVPN. Intent is for the user to use the script protonvpn-cli script and incorporate a killswitch type profile to harden the connection.
1. IPv6 totally disabled to prevent leaks
2. Local traffic allowed
3. All traffic to WAN forced through VPN or blocked
4. Default is all in and out denied

### Parts
1. /ufw/ - Current working/in-use solution using ufw - forcevpn script file should be placed in your local bin and files within /etc/ changed appropriately in their matching locations.
2. /proton/ - The function in ProtonVPN's cli script for the killswitch, which is currently disabled in the script. This can be used as a guide, but also needs consideration should Proton enable it within the cli script.
3. /scripts/ - potential alternatives to the ufw solution.

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

### VPN considerations
1. Use UDP for faster speeds and TCP for more reliability and less firewall issues by using common ports.
2. Many sites do not like VPN users. Connections are often disallowed or are placed into a verification process, like captcha for example.

### To do
1. Ideally this will be a more comprehensive management script. Until then, the core rules need to be set and tested
2. Evaluate need to further restrict by interface (wlo, eth, etc), protocol and port
3. Make sure that all DNS is routed properly, routes shows possibility there is a potential leak

### Local Ubuntu files of interest for disabling IPv6
1. /etc/ufw/sysctl.conf
2. /etc/default/ufw
3. /etc/sysctl.conf

# Credits
All in /proton/ sourced directly from ProtonVPN (https://github.com/ProtonVPN). All other scripts sourced from random online resources and modified as needed to suit this project.
