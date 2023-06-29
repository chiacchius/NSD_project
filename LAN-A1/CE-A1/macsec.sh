#ens33 address configuration

sudo echo 1 > /proc/sys/net/ipv4/ip_forward
sudo ip addr add 160.80.10.2/30 dev ens33



#macsec configuration
export MKA_CAK=00112233445566778899aabbccddeeff #Connectivity Association Key Pre Shared
export MKA_CKN=0000111122223333444455556666777788889999000011112222333344445555 #Connectivity Association Key Name to identify CAK

nmcli connection del macsec-conf

nmcli connection add type macsec \
con-name macsec-conf \
ifname macsec0 \
connection.autoconnect no \
macsec.parent ens37 \
macsec.mode psk \
macsec.mka-cak $MKA_CAK \
macsec.mka-cak-flags 0 \
macsec.mka-ckn $MKA_CKN \
ipv4.method manual ipv4.addresses 10.23.0.1/24

nmcli connection up macsec-conf

sudo ip route add default via 160.80.10.1
