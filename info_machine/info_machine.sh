#!/bin/bash

# Afficher le nom de l'hôte (hostname)
echo "Nom de l'hôte : $(hostname)"

# Afficher l'adresse IP de la machine
echo "Adresse IP : $(hostname -I)"

# Afficher les informations sur le système d'exploitation
echo "Système d'exploitation : $(cat /etc/os-release | grep PRETTY_NAME | cut -d'=' -f2 | tr -d '"')"

# Afficher la version du noyau
echo "Version du noyau : $(uname -r)"

# Afficher la quantité de mémoire RAM disponible
echo "Mémoire RAM disponible : $(free -h | awk '/Mem/{print $2}')"

# Afficher la quantité d'espace disque disponible dans le répertoire racine
echo "Espace disque disponible : $(df -h / | awk 'NR==2{print $4}')"

# Afficher la liste des utilisateurs connectés
echo "Utilisateurs connectés :"
who

# Afficher la liste des processus en cours d'exécution
echo "Processus en cours d'exécution :"
ps aux
