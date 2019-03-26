#!/bin/bash

# Source: https://gist.github.com/twkm/a16fedcce83cce2e0989b4d4c2615c05

### BEGIN INIT INFO
# Provides:          killswitch
# Required-Start:    openvpn $network $remote_fs $syslog
# Required-Stop:     openvpn $network $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: VPN Killswitch
# Description: This script uses UFW to ensure all traffic goes through VPN
### END INIT INFO

# From http://unix.stackexchange.com/questions/20357/how-can-i-make-a-script-in-etc-init-d-start-at-boot
# http://jasonleveille.com/blog/2013/01/debian-ubuntu-adding-a-startup-script/
# https://wiki.debian.org/LSBInitScripts

log() {
    echo "$(date) $1" >> ~/vpnkillswitch.log
}

start() {

    log "Starting VPN Killswitch"

    VPN_CHECKS=3
    VPN_SUCCESS=false

    while [[ $VPN_CHECKS -ne 0 ]]; do

    	log "Checking for VPN. Attempts remaining: $VPN_CHECKS..."

    	if [[ -n $(pgrep openvpn) ]]
    		then
			VPN_SUCCESS=true
    			break
    	fi

    	sleep 5

    	VPN_CHECKS=$(( $VPN_CHECKS - 1 ))

    done

    WAN_IP=false
    IP_CHECKS=5
    IP_SUCCESS=false

    if [[ $VPN_SUCCESS = true ]]
    	then
    		log "OpenVPN is running. Checking for IP..."
		while [[ $IP_CHECKS -ne 0 ]]; do
			IP_CHECK_ATTEMPT=$(( $IP_CHECKS + 1 - $IP_CHECKS))
			log "Checking for IP attempt $IP_CHECK_ATTEMPT..."

			# Get the IP Address we want to enable for outgoing connections
   			WAN_IP=$(wget -q -T 15 -O - http://ipinfo.io)

			if [[ -n $WAN_IP ]]; then
				log "IP found: $WAN_IP"
				IP_SUCCESS=true
				break;
			else
				sleep 5
				IP_CHECKS=$(( $IP_CHECKS - 1 ))
			fi

		done

    	else
    		log "OpenVPN is not running."
		exit 1
    fi

    ALLOW_FROM_IP_RANGE="192.168.1.0/24" # IP range to allow local connection
    ALLOW_FROM_IP_SSH="192.168.1.0/24" # IP Range to allow SSH access

    # Default deny
    ufw default deny outgoing
    ufw default deny incoming
    # Allow DNS Traffic
    sudo ufw allow out 53
    # Allow local network traffic
    ufw allow from $ALLOW_FROM_IP_RANGE
    # Allow local SSH
    sudo ufw allow from $ALLOW_FROM_IP_SSH to any port 22
    # Allow VPN traffic
    ufw allow out on tun0 from any to any
    ufw allow in on tun0 from any to any
    # Allow connection to VPN IP, get from current IP (to allow reconnection)
    #ufw allow out from any to $WAN_IP # Uncomment to allow VPN connection, leave commented to ensure no out traffic outside of vpn
    yes | ufw enable
    UFW_STATUS=$(ufw status)

    log "$UFW_STATUS"
    log "Current IP: $WAN_IP"

    # Start Kodi
    exit 0
}

stop() {
    # code to stop app comes here 
    # example: killproc program_name
    ufw disable
    yes | ufw reset
    ufw status

    log "Stopping VPN Killswitch..."
}

case "$1" in 
    start)
       stop
       start
       ;;
    stop)
       stop
       ;;
    reload|force-reload|restart)
       stop
       start
       ;;
    status)
       # code to check status of app comes here 
       # example: status program_name
       ufw status
       ;;
    *)
       echo "Usage: $0 {start|stop|status|restart}"
esac

exit 0 