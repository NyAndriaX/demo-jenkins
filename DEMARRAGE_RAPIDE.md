# 🚀 Démarrage Rapide - TP Jenkins

## ✅ État actuel
- **Jenkins** : Installé et fonctionnel sur http://localhost:8080
- **Projet** : Poussé sur GitHub (https://github.com/NyAndriaX/demo-jenkins.git)
- **Pipeline** : Jenkinsfile prêt avec toutes les étapes

## 🎯 Objectif du TP
Créer un job de type pipeline dans Jenkins qui utilise votre dépôt GitHub et exécute automatiquement le build Maven.

## 📋 Étapes à suivre MAINTENANT

### 1. Accéder à Jenkins
```
URL: http://localhost:8080
Mot de passe: 5b29b479f72f46949904e04dad5fc42f
```

### 2. Configuration initiale (première fois)
1. Entrez le mot de passe initial
2. Cliquez sur "Install suggested plugins"
3. Attendez l'installation des plugins
4. Créez votre compte administrateur
5. Cliquez sur "Save and Continue"

### 3. Installation des plugins nécessaires
1. **Manage Jenkins** > **Manage Plugins**
2. Onglet **Available**
3. Recherchez et installez :
   - ✅ **Git plugin**
   - ✅ **Pipeline plugin**
   - ✅ **Maven Integration plugin**
   - ✅ **JUnit plugin**
4. Redémarrez Jenkins si demandé

### 4. Configuration de Maven
1. **Manage Jenkins** > **Global Tool Configuration**
2. Section **Maven**
3. Cliquez sur **Add Maven**
4. **Name**: `Maven`
5. **MAVEN_HOME**: laissez vide
6. **Save**

### 5. Création du job Pipeline
1. **Dashboard** > **New Item**
2. **Item name**: `DemoIC-Pipeline`
3. Sélectionnez **Pipeline**
4. Cliquez **OK**

### 6. Configuration du Pipeline
1. **Definition**: `Pipeline script from SCM`
2. **SCM**: `Git`
3. **Repository URL**: `https://github.com/NyAndriaX/demo-jenkins.git`
4. **Branch Specifier**: `*/main`
5. **Script Path**: `Jenkinsfile`
6. **Save**

### 7. Premier Build ! 🎉
1. Cliquez sur **Build Now**
2. Suivez l'exécution dans la console
3. Vérifiez que toutes les étapes passent :
   - ✅ Checkout
   - ✅ Build
   - ✅ Test
   - ✅ Package
   - ✅ Archive

## 🔧 Dépannage rapide

### Jenkins ne démarre pas
```bash
sudo docker restart jenkins
```

### Maven non trouvé
- Vérifiez la configuration dans "Global Tool Configuration"
- Assurez-vous que Maven est installé sur le système

### Erreur Git
- Vérifiez l'URL du dépôt
- Assurez-vous que le dépôt est public ou ajoutez des credentials

## 📊 Résultats attendus
- **Build** : Compilation réussie
- **Tests** : 1 test passé
- **Package** : JAR créé dans target/
- **Artefacts** : JAR archivé dans Jenkins

## 🎯 Validation du TP
✅ Jenkins installé et configuré  
✅ Job de type pipeline créé  
✅ Pipeline lié à votre dépôt GitHub  
✅ Build automatique fonctionnel  
✅ Bouton "Build Now" opérationnel  

## 🚀 Prochaines étapes
- Modifiez le code dans GitHub
- Déclenchez un nouveau build
- Explorez les rapports de tests
- Configurez des webhooks pour build automatique

---

**🎉 Félicitations ! Vous avez terminé votre TP Jenkins !**
