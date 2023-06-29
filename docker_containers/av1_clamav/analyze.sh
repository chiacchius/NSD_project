ip addr add 10.123.0.101/16 dev eth0
ip route add default via 10.123.0.1

while true; do

        echo "Clamav, Waiting for a new file to analyze!"
        python3 receive.py malware 1234

        clamscan malware > log1.log
	python3 send.py log1.log 10.23.1.100 1111

        rm malware

done
