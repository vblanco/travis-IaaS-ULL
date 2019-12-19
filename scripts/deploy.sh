#!/bin/bash
echo "Open VPN connection...."
sudo cp my.conf /etc/vpnc
sudo vpnc my
echo "Connect to deployment backend...."
ip a
ip r
echo "Disconnect VPN"
sudo vpnc-disconnect

#--

