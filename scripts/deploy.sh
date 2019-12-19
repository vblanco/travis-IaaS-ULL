#!/bin/bash
echo "Open VPN connection...."
sudo vpnc ull

sleep 5
echo "Connect to deployment backend...."
echo "Network information"
ip a
ip r

echo "Trying ssh to a backend server...."
ssh usuario@10.6.129.109 hostname
ssh usuario@10.6.129.109 whoami
ssh usuario@10.6.129.109 ls -l
ssh usuario@10.6.129.109 ps fx

echo "Disconnect VPN"
sudo vpnc-disconnect

#--

