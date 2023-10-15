#!/bin/bash

if ! [ -x "$(command -v jq)" ]; then
  echo "Erreur : jq n\'est pas installé. Installez le avec la commande : apt install jq"
  exit 1
fi

if [[ $# -ne 1 ]]; then
	echo "Veuillez fournir une adresse IP en tant que paramètre en ligne de commande. Utilisation : ' $0 ' 15.45.0.1 "
	exit 1
fi
lien=$(echo "http://ip-api.com/json/"$1)
donnees=$(curl $lien -s) 

statut=$(echo $donnees | jq '.status' -r)

if [[ $statut == "success" ]]; then
    ville=$(echo $donnees | jq '.city' -r)
	nomRegion=$(echo $donnees | jq '.regionName' -r)
	pays=$( echo $donnees | jq '.country' -r)
	echo $ville, $nomRegion en $pays.
fi
