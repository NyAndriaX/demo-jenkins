# Configuration Jenkins pour le projet DemoIC

## État actuel
- ✅ Jenkins installé et en cours d'exécution via Docker
- ✅ Projet Maven testé et fonctionnel localement
- ✅ Jenkinsfile créé pour le pipeline

## Accès à Jenkins
- **URL**: http://localhost:8080
- **Mot de passe initial**: `5b29b479f72f46949904e04dad5fc42f`

## Étapes de configuration Jenkins

### 1. Configuration initiale
1. Ouvrir http://localhost:8080 dans votre navigateur
2. Entrer le mot de passe initial
3. Installer les plugins suggérés
4. Créer un compte administrateur

### 2. Installation des plugins nécessaires
Dans Jenkins, aller dans "Manage Jenkins" > "Manage Plugins" et installer :
- **Git plugin** (pour la gestion des dépôts Git)
- **Pipeline plugin** (pour les pipelines)
- **Maven Integration plugin** (pour l'intégration Maven)
- **JUnit plugin** (pour les rapports de tests)

### 3. Configuration de Maven
1. Aller dans "Manage Jenkins" > "Global Tool Configuration"
2. Dans la section "Maven", ajouter une installation Maven :
   - **Name**: `Maven`
   - **MAVEN_HOME**: `/usr/share/maven` (ou laisser vide pour auto-détection)

### 4. Création du job de type Pipeline
1. Cliquer sur "New Item"
2. Choisir "Pipeline"
3. Nommer le job : `DemoIC-Pipeline`
4. Dans la configuration :
   - **Definition**: "Pipeline script from SCM"
   - **SCM**: "Git"
   - **Repository URL**: URL de votre dépôt Git distant
   - **Credentials**: Ajouter vos identifiants Git si nécessaire
   - **Branch Specifier**: `*/main` ou `*/master`
   - **Script Path**: `Jenkinsfile`

### 5. Configuration du pipeline
Le Jenkinsfile créé contient les étapes suivantes :
- **Checkout**: Récupération du code depuis Git
- **Build**: Compilation avec Maven
- **Test**: Exécution des tests
- **Package**: Création du package JAR
- **Archive**: Archivage des artefacts

### 6. Exécution du pipeline
1. Une fois configuré, le bouton "Build Now" apparaîtra
2. Cliquer sur "Build Now" pour lancer le pipeline
3. Suivre l'exécution dans la console de build

## Structure du projet
```
demoic/
├── pom.xml                 # Configuration Maven
├── Jenkinsfile            # Pipeline Jenkins
├── src/
│   ├── main/java/         # Code source
│   └── test/java/         # Tests
└── target/                # Fichiers générés
```

## Commandes utiles

### Gestion du conteneur Jenkins
```bash
# Vérifier le statut
sudo docker ps

# Voir les logs
sudo docker logs jenkins

# Arrêter Jenkins
sudo docker stop jenkins

# Redémarrer Jenkins
sudo docker restart jenkins

# Supprimer le conteneur
sudo docker rm jenkins
```

### Test local du projet
```bash
# Compilation
mvn clean compile

# Tests
mvn test

# Package complet
mvn clean package
```

## Dépannage
- Si Jenkins ne démarre pas, vérifier les logs : `sudo docker logs jenkins`
- Si Maven n'est pas trouvé, vérifier la configuration dans "Global Tool Configuration"
- Si les tests échouent, vérifier que le projet compile localement
