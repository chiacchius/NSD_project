echo 1 > /proc/sys/net/ipv4/ip_forward
ip addr add 160.80.5.2/30 dev eth0
ip addr add 10.23.1.1/24 dev eth1
ip route add default via 160.80.5.1
