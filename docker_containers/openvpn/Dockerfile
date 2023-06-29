from weibeld/ubuntu-networking
RUN apt-get update
RUN apt-get install nano netcat traceroute nmap openvpn easy-rsa -y
RUN mkdir /openvpn
RUN mkdir /shared_openvpn
VOLUME /shared_openvpn
ADD hostB1_configuration.sh /openvpn/hostB1_configuration.sh
ADD hostB2_configuration.sh /openvpn/hostB2_configuration.sh
ADD server_configuration.sh /openvpn/server_configuration.sh
ADD hostB2 /openvpn/hostB2
ADD hostB2_openvpn.sh /openvpn/hostB2_openvpn.sh
ADD server_openvpn.sh /openvpn/server_openvpn.sh
ADD hostB2.ovpn /openvpn/hostB2.ovpn
ADD server.ovpn /openvpn/server.ovpn

