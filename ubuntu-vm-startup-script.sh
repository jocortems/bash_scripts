#! /bin/bash
apt update
apt install -y tcpdump hping3 inetutils-traceroute tcptraceroute dnsutils netcat build-essential git apt-transport-https ca-certificates curl software-properties-common
git clone https://github.com/microsoft/ntttcp-for-linux.git
cd ntttcp-for-linux/src/
make
make install
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt update
apt install -y docker-ce
docker run -d -p 8080:8080 jorgecortesdocker/myipapp:v3
