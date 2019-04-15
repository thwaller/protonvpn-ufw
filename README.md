# vpn-control

Script to enhance security (sort of aka killswitch) while using VPN on Ubuntu 18.04.2 LTS. Should work on most Linux systems and most VPN services. Most VPN services include some sort of connection security, but many also prove to have leaks such as DNS and IPv6. When using OpenVPN with Linux, some VPNs do not come with a management application but rather just use settings that are manually entered into network-manager or a cli script to control. In addition to leaks, there is a security concern should the VPN connection drop as there is no visible indicator to show whether the VPN is on or off. So for additional security, should the VPN drop, so does the internet connectivity.

#### General Goals
1. IPv6 totally disabled to prevent leaks
2. Local traffic allowed including allow for multicasting
3. All traffic to WAN forced through VPN or blocked
4. Default is all in and out denied

#### Parts
- forcevpn - the script itself. Using the script will not allow internet connection without VPN service active.
- Folders
 - /ipv6-disable/ - files within /etc/* changed respectively.
 - /proton-vpn/ - The function in ProtonVPN's cli script for the killswitch, which is currently disabled in the script. This can be used as a guide, but also needs consideration should Proton enable it within the cli script.
 - /sample-scripts/ - some samples of other approaches.

### Notes
This script was originally started to harden the free plan with ProtonVPN. I have since adding PIA VPN and plan to use the same script with the same intent ... harden the provided app or script from the VPN provider. It appears the script will be mostly universal, but in this case, ProtonVPN use will require more rules in the script to harden it as there is no killswitch provided.

This script is ever evolving so please suggest improvements or fixes.
