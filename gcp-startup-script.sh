#!/bin/bash
apt update -y && apt upgrade -y
apt install -y tcpdump hping3 inetutils-traceroute netcat
