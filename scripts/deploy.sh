#!/bin/bash
echo "Open VPN connection...."
sudo vpnc ull

sleep 5
echo "Connect to deployment backend...."
echo "Network information"
ip a
ip r

sleep 5
echo "Trying ssh to a backend server...."
ssh usuario@10.6.129.109 hostname

sleep 5
echo "Disconnect VPN"
sudo vpnc-disconnect

#--

