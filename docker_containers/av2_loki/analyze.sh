ip addr add 10.123.0.102/16 dev eth0
ip route add default via 10.123.0.1

cd /Loki
mkdir /mw_to_scan
while true; do

	echo "Loki, Waiting for a new file to analyze!"
	python3 receive.py malware 1234
	mv malware /mw_to_scan
        python3 loki.py -p /mw_to_scan > log2.log

        python3 send.py log2.log 10.23.1.100 2222
	rm /mw_to_scan/malware

done


