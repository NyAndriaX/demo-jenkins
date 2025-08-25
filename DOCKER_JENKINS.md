# Jenkins Docker avec Java, Git et Maven

Ce projet contient une configuration Docker pour exécuter Jenkins avec tous les outils nécessaires pour le développement Java.

## 🐳 Ce qui est inclus

- **Jenkins LTS** (dernière version stable)
- **Java 17** (OpenJDK)
- **Git** (dernière version)
- **Maven 3.9.6** (Apache Maven)

## 🚀 Démarrage rapide

### Option 1: Utiliser le script automatique
```bash
./build-and-run-jenkins.sh
```

### Option 2: Commandes manuelles
```bash
# Construire l'image
docker-compose build

# Démarrer Jenkins
docker-compose up -d

# Voir les logs
docker-compose logs -f jenkins
```

## 🌐 Accès à Jenkins

Une fois démarré, Jenkins sera accessible sur :
- **URL**: http://localhost:8080
- **Port Jenkins**: 8080
- **Port Agent**: 50000

## 🔑 Premier démarrage

1. Récupérez le mot de passe initial dans les logs :
   ```bash
   docker-compose logs jenkins | grep "Jenkins initial admin password"
   ```

2. Suivez l'assistant de configuration Jenkins

3. Installez les plugins recommandés

## 🛠️ Vérification des outils

Pour vérifier que tous les outils sont installés, connectez-vous à Jenkins et créez un job de test :

```bash
# Dans un job Jenkins, utilisez ces commandes :
java -version
git --version
mvn -version
```

## 📁 Structure des volumes

- **Jenkins Home**: `/var/jenkins_home` (persistant)
- **Docker Socket**: `/var/run/docker.sock` (pour Docker-in-Docker)

## 🔧 Commandes utiles

```bash
# Voir les logs en temps réel
docker-compose logs -f jenkins

# Arrêter Jenkins
docker-compose down

# Redémarrer Jenkins
docker-compose restart

# Accéder au shell du conteneur
docker exec -it jenkins-with-tools bash

# Voir les processus en cours
docker-compose ps
```

## 🧹 Nettoyage

Pour supprimer complètement :
```bash
# Arrêter et supprimer les conteneurs
docker-compose down

# Supprimer les volumes (ATTENTION: supprime toutes les données Jenkins)
docker volume rm demoic_jenkins_home

# Supprimer l'image
docker rmi jenkins-with-tools
```

## 📋 Prérequis

- Docker
- Docker Compose
- Au moins 4GB de RAM disponible
- Au moins 10GB d'espace disque

## 🚨 Notes importantes

- Le premier démarrage peut prendre plusieurs minutes
- Jenkins utilise le port 8080 par défaut
- Toutes les données Jenkins sont persistées dans un volume Docker
- L'image contient Java 17, compatible avec votre projet Maven

## 🔍 Dépannage

### Jenkins ne démarre pas
```bash
# Vérifier les logs
docker-compose logs jenkins

# Vérifier l'espace disque
df -h

# Vérifier la mémoire
free -h
```

### Problème de permissions
```bash
# Redémarrer avec les bonnes permissions
docker-compose down
sudo chown -R 1000:1000 jenkins_home/
docker-compose up -d
```
