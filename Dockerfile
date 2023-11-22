# Utilisez une image Flutter en tant qu'image de base
#FROM mobiledevops/flutter-sdk-image
FROM ubuntu:latest

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
    git \
    curl \
    unzip \
    xz-utils

# Set up Flutter environment variables
ENV PATH="/flutter/bin:${PATH}"

# Download and install Flutter
RUN git clone https://github.com/flutter/flutter.git /flutter && \
    /flutter/bin/flutter --version


# Créez un répertoire de travail dans le conteneur
WORKDIR /app

# Copiez le fichier pubspec.yaml séparément pour tirer parti du cache Docker
COPY pubspec.yaml pubspec.yaml

# Copiez les fichiers restants dans le conteneur
COPY . .
#RUN flutter -v

# Obtenez les dépendances du projet et mettez à niveau les packages
RUN flutter pub upgrade && flutter pub get

# Nettoyez le cache Flutter
RUN flutter clean

# Construisez l'application Flutter
RUN flutter build apk --release

# Commande par défaut pour exécuter l'application (changez-la selon vos besoins)
CMD ["flutter", "run", "--no-sound-null-safety"]
