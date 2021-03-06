#!/bin/sh
apt update -y && apt upgrade -y
apt install -y tcpdump hping3 inetutils-traceroute tcptraceroute dnsutils nginx netcat
echo "net.ipv4.conf.all.accept_redirects = 0" | tee -a /etc/sysctl.conf
echo "net.ipv4.conf.all.send_redirects = 0" | tee -a /etc/sysctl.conf
echo "net.ipv4.ip_forward=1" | tee -a /etc/sysctl.conf
sysctl -p
echo $(hostname) | tee /var/www/html/index.nginx-debian.html
iptables -A FORWARD -i eth0 -o eth0 -j ACCEPT
