#!/bin/bash

echo "Bienvenue, je suis prêt à chiffrer un fichier/dossier pour vous."
echo "Pour des raisons de sécurité, assurez-vous que ce script est dans le même dossier que le fichier à chiffrer."
echo "Entrez le nom exact du fichier avec l'extension :"
read -r file

# Demander un mot de passe pour le chiffrement
read -s -p "Entrez un mot de passe pour le chiffrement : " password
echo

# Vérifier si le fichier existe
if [ -e "$file" ]; then
    # Chiffrer le fichier avec GPG en utilisant le mot de passe
    echo "$password" | gpg --batch --passphrase-fd 0 -c "$file"
    echo "J'ai chiffré le fichier avec succès."

    # Sauvegarder le fichier original (ajoutez une extension .bak)
    mv "$file" "$file.bak"
    echo "Le fichier original a été sauvegardé en tant que $file.bak."

    # Effacer le fichier original
    rm -rf "$file"
    echo "Le fichier original a été supprimé pour des raisons de sécurité."
else
    echo "Le fichier n'existe pas dans le répertoire actuel."
fi
