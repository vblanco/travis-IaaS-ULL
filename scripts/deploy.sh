#!/bin/bash
echo "Open VPN connection...."
sudo vpnc --debug 3 ull

sleep 5
echo "Connect to deployment backend...."
echo "Network information"
ip a
ip r
echo "Tracepaht to backend ..."

sleep 5
echo "Trying ssh to a backend server...."
ssh -v usuario@10.6.129.109 hostname

sleep 5
echo "Disconnect VPN"
sudo vpnc-disconnect

#--

