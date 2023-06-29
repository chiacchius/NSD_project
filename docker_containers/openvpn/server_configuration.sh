# Network configuration
ip addr add 2.0.0.2/24 dev eth1
ip addr add 192.168.17.1/24 dev eth0
ip route add default via 2.0.0.1
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
echo 1 > /proc/sys/net/ipv4/ip_forward
