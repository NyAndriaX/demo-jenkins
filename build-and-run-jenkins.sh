#!/bin/bash

echo "🚀 Construction et démarrage de Jenkins avec Java, Git et Maven..."

# Arrêter et supprimer les conteneurs existants
echo "🛑 Arrêt des conteneurs existants..."
docker-compose down

# Supprimer l'image existante (optionnel)
echo "🗑️  Suppression de l'ancienne image..."
docker rmi jenkins-with-tools 2>/dev/null || true

# Construire l'image
echo "🔨 Construction de l'image Docker..."
docker-compose build --no-cache

# Démarrer le service
echo "▶️  Démarrage de Jenkins..."
docker-compose up -d

# Attendre que Jenkins soit prêt
echo "⏳ Attente que Jenkins soit prêt..."
sleep 30

# Afficher les logs
echo "📋 Logs du conteneur Jenkins:"
docker-compose logs jenkins

echo ""
echo "✅ Jenkins est maintenant accessible sur http://localhost:8080"
echo "🔑 Le mot de passe initial se trouve dans les logs ci-dessus"
echo "📁 Répertoire Jenkins: /var/jenkins_home"
echo ""
echo "🔧 Outils installés:"
echo "   - Java 17"
echo "   - Git"
echo "   - Maven 3.9.6"
echo ""
echo "📝 Commandes utiles:"
echo "   - Voir les logs: docker-compose logs -f jenkins"
echo "   - Arrêter: docker-compose down"
echo "   - Redémarrer: docker-compose restart"
