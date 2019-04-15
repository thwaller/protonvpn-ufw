These files are a point-in-time copy/paste from ProtonVPN's CLI script. Intent is for easy reference and not modification as it is my understanding Proton is still "beta" on this script.

The Linux cli for ProtonVPN can be referenced here: https://github.com/ProtonVPN. Intent is for the user to use the script protonvpn-cli script and incorporate a killswitch type profile to harden the connection.

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
