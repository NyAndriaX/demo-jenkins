#!/bin/bash

echo "=== Configuration Git pour le projet DemoIC ==="
echo ""

# Vérifier si Git est installé
if ! command -v git &> /dev/null; then
    echo "Installation de Git..."
    sudo apt install git -y
fi

# Initialiser le dépôt Git s'il n'existe pas
if [ ! -d ".git" ]; then
    echo "Initialisation du dépôt Git..."
    git init
    git add .
    git commit -m "Initial commit: Projet DemoIC avec pipeline Jenkins"
    echo "✅ Dépôt Git initialisé"
else
    echo "✅ Dépôt Git déjà initialisé"
fi

# Afficher le statut Git
echo ""
echo "Statut Git actuel :"
git status

echo ""
echo "=== Instructions pour pousser vers un dépôt distant ==="
echo ""
echo "1. Créez un dépôt sur GitHub/GitLab/Bitbucket"
echo "2. Ajoutez le remote avec :"
echo "   git remote add origin <URL_DE_VOTRE_DEPOT>"
echo ""
echo "3. Poussez le code avec :"
echo "   git push -u origin main"
echo ""
echo "4. Configurez Jenkins avec l'URL de votre dépôt distant"
echo ""

# Demander si l'utilisateur veut configurer un remote
read -p "Voulez-vous configurer un dépôt distant maintenant ? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    read -p "Entrez l'URL de votre dépôt distant: " remote_url
    if [ ! -z "$remote_url" ]; then
        git remote add origin "$remote_url"
        echo "✅ Remote 'origin' ajouté: $remote_url"
        echo ""
        echo "Pour pousser le code :"
        echo "git push -u origin main"
    fi
fi

echo ""
echo "=== Configuration terminée ==="
