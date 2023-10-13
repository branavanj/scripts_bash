#!/bin/bash


interfaces=$(ip -o link show | awk -F': ' '{print $2}')


for interface in $interfaces; do
    echo "Informations de configuration pour l'interface $interface :"
    echo "========================================================"
    echo

    if [ -e "/sys/class/net/$interface" ]; then
      
        ip_address=$(ip -4 addr show $interface | awk '/inet / {print $2}')
        
        
        subnet_mask=$(ip -4 addr show $interface | awk '/inet / {print $2}' | cut -d'/' -f2)
        
        
        gateway=$(ip route show dev $interface | awk '/default via/ {print $3}')
        
        
        dns_servers=$(cat /etc/resolv.conf | grep "nameserver" | awk '{print $2}')

        echo "Adresse IP : $ip_address"
        echo "Masque de sous-réseau (CIDR) : /$subnet_mask"
        echo "Passerelle : $gateway"
        echo "Serveurs DNS : $dns_servers"
        echo
    fi
done
