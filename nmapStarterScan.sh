#!/bin/bash
read -p "IP-adress: " IPadress
nmap -F --open $IPadress  > results
echo "Faster scan stoped\nNow -> TCP/UDP port"
nmap -sT --open $IPadress  >>results
echo "Search open TCO/UDP ports stoped\nNow -> Active Machines"
nmap -sn $Ipadress >>results
cat results
