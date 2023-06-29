sudo ip addr add 10.123.0.103/24 dev ens33
sudo ip route add default via 10.123.0.1


echo "RKHunter, Waiting for a new file to analyze!"
python3 receive.py malware 1234

sudo chmod +x malware
./malware &
sleep 5

sudo rkhunter -c --rwo --sk --summary > log3.log
python3 send.py log3.log 10.23.1.100 3333

