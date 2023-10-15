#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then
  echo "Ce script doit être exécuté en tant qu'administrateur (utilisez sudo)."
  exit 1
fi


echo "Interfaces réseau disponibles :"
ip link show | awk -F': ' '{print $2}'


read -p "Saisissez le nom de l'interface à configurer (ex. eth0) : " interface


read -p "Saisissez l'adresse IP : " ip_address
read -p "Saisissez le masque de sous-réseau (en notation CIDR, ex. /24) : " subnet_mask
read -p "Saisissez la passerelle (gateway) : " gateway
read -p "Saisissez le serveur DNS : " dns_server


ip addr add $ip_address$subnet_mask dev $interface
ip route add default via $gateway
echo "nameserver $dns_server" > /etc/resolv.conf


echo "Configuration de l'interface $interface mise à jour :"
echo "Adresse IP : $ip_address$subnet_mask"
echo "Passerelle : $gateway"
echo "Serveur DNS : $dns_server"
