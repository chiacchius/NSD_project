# Network configuration
ip addr add 2.0.0.2/8 dev eth1
ip addr add 192.168.17.1/24 dev eth0
ip route add default via 2.0.0.1
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
echo 1 > /proc/sys/net/ipv4/ip_forward


# ca and key build
cd /usr/share/easy-rsa
cp openssl-1.0.0.cnf openssl.cnf
. ./vars
./clean-all
./build-ca
./build-key-server server
./build-dh
./build-key hostB2


#openvpn configuration
mkdir /gns3volumes/share_openvpn/keys
mkdir /gns3volumes/share_openvpn/keys/ccd
cp -r /usr/share/easy-rsa/keys/ /gns3volumes/share_openvpn/
cp /openvpn/hostB2 /gns3volumes/share_openvpn/keys/ccd/hostB2
cp /openvpn/server.ovpn /gns3volumes/share_openvpn/keys/server.ovpn
