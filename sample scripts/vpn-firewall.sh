#!/bin/bash

# Your VPN ip address, you can use: host yourvpnaddress.com
VPN_IP="X.X.X.X"
# Your VPN name on Network Manager, to list all connections you can use: nmcli con
VPN_NAME="your.vpn.name"
# Your network device, usually wlan0 for wifi and eth0 for cable, check with: ifconfig
NW_DEVICE="wlo1"
# Your local network range, change if different
LOCAL_NW="192.168.1.0/24"
# You VPN connection device, change if different
NW_TUN="tun0"

# Set up the firewall and block all connections
sudo ufw --force reset
sudo ufw default deny incoming
sudo ufw default deny outgoing
# Allow the connection only to/from our VPN server
sudo ufw allow out on $NW_DEVICE from any to $VPN_IP
sudo ufw allow out on $NW_TUN from any to any
sudo ufw allow in on $NW_TUN from any to any
# Allow local network connections
sudo ufw allow out on $NW_DEVICE from any to $LOCAL_NW
sudo ufw allow in on $NW_DEVICE from $LOCAL_NW to any
sudo ufw enable

# Monitor VPN connection and connect again if dropped
function monitor {
    # Connect to VPN
    nmcli con up id $VPN_NAME
    echo -e '\nMonitoring VPN connection for possible drops. Press Ctrl + Z to stop monitoring\n'
    nmcli connection monitor $NW_TUN # Will exit as soon as status changes
    echo -e '\n############################\nConnection to VPN dropped - Reconnecting...\n############################\n'
    nmcli con down id $VPN_NAME # Just in case connection was in progress
    sleep 5 # To allow VPN detect we are not connected anymore
    nmcli con up id $VPN_NAME
    monitor
}

monitor