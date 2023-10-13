#!/bin/bash

# Informations sur la RAM
total_ram=$(free -h | awk '/^Mem:/ {print $2}')
used_ram=$(free -h | awk '/^Mem:/ {print $3}')
free_ram=$(free -h | awk '/^Mem:/ {print $4}')

# Informations sur le processeur
cpu_model=$(cat /proc/cpuinfo | grep 'model name' | uniq | cut -d':' -f2 | sed -e 's/^[ \t]*//')
cpu_cores=$(nproc)

# Informations sur le système
os_version=$(cat /etc/os-release | grep 'PRETTY_NAME' | cut -d'=' -f2 | tr -d '"')
kernel_version=$(uname -r)

# Affichage des informations
echo "Informations sur la RAM:"
echo "Total: $total_ram"
echo "Utilisée: $used_ram"
echo "Libre: $free_ram"
echo

echo "Informations sur le processeur:"
echo "Modèle: $cpu_model"
echo "Nombre de cœurs: $cpu_cores"
echo

echo "Informations sur le système:"
echo "Système d'exploitation: $os_version"
echo "Version du noyau: $kernel_version"
