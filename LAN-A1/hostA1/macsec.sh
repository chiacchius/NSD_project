export MKA_CAK=00112233445566778899aabbccddeeff #Connectivity Association Key
export MKA_CKN=0000111122223333444455556666777788889999000011112222333344445555 #Connectivity Association Key Name to identify CAK

nmcli connection del macsec-conf

nmcli connection add type macsec \
con-name macsec-conf \
ifname macsec0 \
connection.autoconnect no \
macsec.parent ens33 \
macsec.mode psk \
macsec.mka-cak $MKA_CAK \
macsec.mka-cak-flags 0 \
macsec.mka-ckn $MKA_CKN \
ipv4.method manual ipv4.addresses 10.23.0.101/24

nmcli connection up macsec-conf
ip route add default via 10.23.0.1
