#!/bin/bash
echo "Open VPN connection...."
sudo vpnc ull

sleep 5
echo "Connect to deployment backend...."
echo "Network information"
ip a
ip r
echo "Tracepath to backend ..."
tracepath 10.6.129.109
echo "ip route to backend ..."
ip route get 10.6.129.109

sleep 5
echo "Trying ssh to a backend server...."
ssh -v usuario@10.6.129.109 hostname
scp README.md usuario@10.6.129.109:/tmp

sleep 5
echo "Disconnect VPN"
sudo vpnc-disconnect

#--

