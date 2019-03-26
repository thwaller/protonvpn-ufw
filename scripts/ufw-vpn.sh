ufw --force reset
ufw default deny incoming
ufw default deny outgoing
ufw allow in on tun0
ufw allow out on tun0
ufw allow in on wlo1 from 192.168.1.0/24
ufw allow out on wlo1 to 192.168.1.0/24
ufw allow out on wlo1 to 198.51.100.0 port 1194  proto udp
ufw allow in on wlo1 from 198.51.100.0 port 1194 proto udp
ufw enable