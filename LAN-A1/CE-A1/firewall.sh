#firewall configuration

export LAN=macsec0
export EXT=ens33

iptables -F
iptables -P FORWARD DROP
iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT



#rule 1
iptables -A FORWARD -i $LAN -o $EXT -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED -j ACCEPT
iptables -t nat -A POSTROUTING -o $EXT -s 10.23.0.101 -j SNAT --to 10.23.0.10
iptables -t nat -A POSTROUTING -o $EXT -s 10.23.0.102 -j SNAT --to 10.23.0.20

#rule 2
iptables -A INPUT -i $LAN -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -i $LAN -p icmp -j ACCEPT

#rule 3
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

#rule 4
iptables -A FORWARD -i $EXT -o $LAN -p tcp --dport 80 -j ACCEPT
iptables -t nat -A PREROUTING -i $EXT -p tcp --dport 80 -d 10.23.0.10 -j DNAT --to 10.23.0.101
iptables -t nat -A PREROUTING -i $EXT -p tcp --dport 80 -d 10.23.0.20 -j DNAT --to 10.23.0.102
#iptables -A FORWARD -i $EXT -o $LAN -p tcp --dport 80 -j ACCEPT


