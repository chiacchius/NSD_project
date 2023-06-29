ip addr add 192.168.16.10/24 dev eth0
ip route add default via 192.168.16.1

cp /openvpn/hostB2.ovpn /gns3volumes/share_openvpn/hostB2.ovpn
touch /gns3volumes/share_openvpn/ca.crt
touch /gns3volumes/share_openvpn/hostB2.crt
touch /gns3volumes/share_openvpn/hostB2.key
