#!/bin/bash

echo "Bienvenue, je suis prêt à déchiffrer un fichier chiffré pour vous."
echo "Pour des raisons de sécurité, assurez-vous que ce script est dans le même dossier que le fichier chiffré."
echo "Entrez le nom exact du fichier chiffré avec l'extension :"
read -r encrypted_file


read -s -p "Entrez le mot de passe pour le déchiffrement : " password
echo


if [ -e "$encrypted_file" ]; then
    
    filename=$(basename "$encrypted_file")
    filename_noext="${filename%.*}"

    
    echo "$password" | gpg --batch --passphrase-fd 0 -o "$filename_noext" -d "$encrypted_file"
    
    if [ -e "$filename_noext" ]; then
        echo "Le fichier a été déchiffré avec succès et enregistré sous le nom '$filename_noext'."
    else
        echo "Erreur lors du déchiffrement du fichier."
    fi
else
    echo "Le fichier chiffré n'existe pas dans le répertoire actuel."
fi

