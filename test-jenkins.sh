#!/bin/bash

echo "=== Test de Jenkins ==="
echo ""

# Vérifier que le conteneur Jenkins est en cours d'exécution
echo "1. Vérification du conteneur Jenkins..."
if sudo docker ps | grep -q jenkins; then
    echo "✅ Jenkins est en cours d'exécution"
else
    echo "❌ Jenkins n'est pas en cours d'exécution"
    exit 1
fi

# Vérifier que Jenkins répond sur le port 8080
echo ""
echo "2. Test de connectivité Jenkins..."
if curl -s http://localhost:8080 > /dev/null; then
    echo "✅ Jenkins répond sur http://localhost:8080"
else
    echo "❌ Jenkins ne répond pas sur le port 8080"
    exit 1
fi

# Afficher les informations d'accès
echo ""
echo "3. Informations d'accès :"
echo "   URL: http://localhost:8080"
echo "   Mot de passe initial: $(sudo docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword 2>/dev/null || echo 'Non disponible')"

# Vérifier les logs récents
echo ""
echo "4. Derniers logs Jenkins :"
sudo docker logs jenkins --tail 5

echo ""
echo "=== Test terminé ==="
echo "Ouvrez http://localhost:8080 dans votre navigateur pour configurer Jenkins"
