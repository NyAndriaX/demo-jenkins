# Utiliser l'image officielle Jenkins LTS comme base
FROM jenkins/jenkins:lts-jdk17

# Passer en utilisateur root pour installer les packages
USER root

# Mettre à jour les packages et installer les dépendances nécessaires
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    unzip \
    software-properties-common \
    apt-transport-https \
    ca-certificates \
    gnupg \
    lsb-release \
    && rm -rf /var/lib/apt/lists/*

# Installer Git
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Installer Maven
RUN wget https://archive.apache.org/dist/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz \
    && tar -xzf apache-maven-3.9.6-bin.tar.gz \
    && mv apache-maven-3.9.6 /opt/maven \
    && rm apache-maven-3.9.6-bin.tar.gz

# Installer Java 17 (en plus de celui déjà présent dans l'image Jenkins)
RUN apt-get update && apt-get install -y openjdk-17-jdk && rm -rf /var/lib/apt/lists/*

# Configurer les variables d'environnement globalement
ENV MAVEN_HOME=/opt/maven
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH=$PATH:$MAVEN_HOME/bin:$JAVA_HOME/bin

# Créer des liens symboliques pour que les outils soient accessibles globalement
RUN ln -sf /opt/maven/bin/mvn /usr/local/bin/mvn && \
    ln -sf /usr/lib/jvm/java-17-openjdk-amd64/bin/java /usr/local/bin/java && \
    ln -sf /usr/bin/git /usr/local/bin/git

# Créer un répertoire pour les outils et y copier les binaires
RUN mkdir -p /usr/local/bin/tools

# Vérifier les installations et s'assurer qu'elles sont accessibles
RUN java -version && \
    git --version && \
    mvn -version && \
    which mvn && \
    which java && \
    which git

# Revenir à l'utilisateur Jenkins
USER jenkins

# Exposer le port Jenkins
EXPOSE 8080

# Commande par défaut
CMD ["/usr/local/bin/jenkins.sh"]
