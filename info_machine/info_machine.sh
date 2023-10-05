#!/bin/bash

echo "Nom de l'hôte : $(hostname)"

echo "Adresse IP : $(hostname -I)"
n
echo "Système d'exploitation : $(cat /etc/os-release | grep PRETTY_NAME | cut -d'=' -f2 | tr -d '"')"

echo "Version du noyau : $(uname -r)"

echo "Mémoire RAM disponible : $(free -h | awk '/Mem/{print $2}')"

echo "Espace disque disponible : $(df -h / | awk 'NR==2{print $4}')"

echo "Utilisateurs connectés :"
who

echo "Processus en cours d'exécution :"
ps aux
