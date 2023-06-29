FROM ubuntu:latest
RUN apt-get update
RUN apt-get install netcat python3 python3-pip wget git iproute2 build-essential python3-dev curl nano libyara-dev  -y 
#RUN git clone https://github.com/mitre/multiscanner.git
RUN git clone https://github.com/Neo23x0/Loki.git
RUN pip install --upgrade pip
RUN pip install --upgrade setuptools
RUN pip install colorama yara-python psutil rfc5424-logging-handler netaddr
WORKDIR Loki
RUN python3 loki-upgrader.py
ADD analyze.sh analyze.sh
ADD receive.py receive.py
ADD send.py send.py
