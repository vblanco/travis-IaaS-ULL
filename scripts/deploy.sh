#!/bin/bash
echo "Open VPN connection...."
sudo vpnc ull
echo "Connect to deployment backend...."
ip a
ip r
echo "Disconnect VPN"
sudo vpnc-disconnect

#--

