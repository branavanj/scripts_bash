#!/bin/bash

# Vérifier si l'utilisateur a les droits d'administration
if [ "$(id -u)" -ne 0 ]; then
  echo "Ce script doit être exécuté en tant qu'administrateur (utilisez sudo)."
  exit 1
fi

# Afficher la liste des interfaces réseau disponibles
echo "Interfaces réseau disponibles :"
ip link show | awk -F': ' '{print $2}'

# Demander le nom de l'interface à configurer
read -p "Saisissez le nom de l'interface à configurer (ex. eth0) : " interface

# Demander les informations de configuration
read -p "Saisissez l'adresse IP : " ip_address
read -p "Saisissez le masque de sous-réseau (en notation CIDR, ex. /24) : " subnet_mask
read -p "Saisissez la passerelle (gateway) : " gateway
read -p "Saisissez le serveur DNS : " dns_server

# Configuration de l'interface
ip addr add $ip_address$subnet_mask dev $interface
ip route add default via $gateway
echo "nameserver $dns_server" > /etc/resolv.conf

# Afficher la configuration mise à jour
echo "Configuration de l'interface $interface mise à jour :"
echo "Adresse IP : $ip_address$subnet_mask"
echo "Passerelle : $gateway"
echo "Serveur DNS : $dns_server"
