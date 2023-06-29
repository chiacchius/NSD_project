FROM ubuntu:latest
RUN apt-get update
RUN apt-get install nano netcat python3 python3-pip iproute2 clamav clamav-daemon -y
RUN freshclam
ADD analyze.sh analyze.sh
ADD receive.py receive.py
ADD send.py send.py
