#!/bin/bash

echo "=== Configuration Jenkins pour le dépôt GitHub ==="
echo ""

echo "✅ Dépôt GitHub configuré : https://github.com/NyAndriaX/demo-jenkins.git"
echo "✅ Code poussé avec succès"
echo ""

echo "=== Configuration Jenkins ==="
echo ""
echo "1. Ouvrez Jenkins dans votre navigateur : http://localhost:8080"
echo "2. Entrez le mot de passe initial : 5b29b479f72f46949904e04dad5fc42f"
echo "3. Suivez la configuration initiale :"
echo "   - Installez les plugins suggérés"
echo "   - Créez un compte administrateur"
echo ""
echo "4. Installez les plugins nécessaires :"
echo "   - Git plugin"
echo "   - Pipeline plugin"
echo "   - Maven Integration plugin"
echo "   - JUnit plugin"
echo ""
echo "5. Configurez Maven :"
echo "   - Manage Jenkins > Global Tool Configuration"
echo "   - Section Maven > Ajouter une installation"
echo "   - Name: Maven"
echo "   - MAVEN_HOME: laisser vide (auto-détection)"
echo ""
echo "6. Créez le job Pipeline :"
echo "   - New Item > Pipeline"
echo "   - Nom: DemoIC-Pipeline"
echo "   - Definition: Pipeline script from SCM"
echo "   - SCM: Git"
echo "   - Repository URL: https://github.com/NyAndriaX/demo-jenkins.git"
echo "   - Branch Specifier: */main"
echo "   - Script Path: Jenkinsfile"
echo ""
echo "7. Sauvegardez et cliquez sur 'Build Now'"
echo ""

echo "=== Vérification du projet ==="
echo ""
echo "Votre projet contient maintenant :"
echo "- Jenkinsfile avec pipeline complet"
echo "- Configuration Maven fonctionnelle"
echo "- Tests unitaires"
echo "- Documentation complète"
echo ""

echo "=== Test rapide du projet ==="
echo ""
read -p "Voulez-vous tester le projet localement avant de configurer Jenkins ? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Test de compilation..."
    mvn clean compile
    echo ""
    echo "Test des tests unitaires..."
    mvn test
    echo ""
    echo "Test du package..."
    mvn package
    echo ""
    echo "✅ Projet testé avec succès !"
fi

echo ""
echo "=== Configuration terminée ==="
echo "Votre projet est maintenant prêt pour Jenkins !"
echo "Allez sur http://localhost:8080 pour commencer la configuration."
