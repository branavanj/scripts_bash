#!/bin/bash

echo "Bienvenue, je suis prêt à chiffrer un fichier/dossier pour vous."
echo "Pour des raisons de sécurité, assurez-vous que ce script est dans le même dossier que le fichier à chiffrer."
echo "Entrez le nom exact du fichier avec l'extension :"
read -r file


read -s -p "Entrez un mot de passe pour le chiffrement : " password
echo


if [ -e "$file" ]; then
   
    echo "$password" | gpg --batch --passphrase-fd 0 -c "$file"
    echo "J'ai chiffré le fichier avec succès."

    rm -rf "$file"
    echo "Le fichier original a été supprimé."
else
    echo "Le fichier n'existe pas dans le répertoire actuel."
fi
