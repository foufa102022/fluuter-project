# Utilisez une image Flutter en tant qu'image de base
FROM cirrusci/flutter:2.10.2

# Créez un répertoire de travail dans le conteneur
WORKDIR /app

# Copiez le fichier pubspec.yaml séparément pour tirer parti du cache Docker
COPY ../pubspec.yaml pubspec.yaml

# Copiez les fichiers restants dans le conteneur
COPY . .

# Obtenez les dépendances du projet
RUN flutter pub get

# Construisez l'application Flutter
RUN flutter build apk --release

# Commande par défaut pour lancer l'application (changez-la selon vos besoins)
CMD ["flutter", "run"]




# # Utilisez une image Flutter en tant qu'image de base
# FROM cirrusci/flutter:2.10.2

# # Copiez les fichiers nécessaires dans le conteneur
# WORKDIR /app
# COPY . .

# # Obtenez les dépendances du projet
# RUN flutter pub get

# # Construisez l'application Flutter
# RUN flutter build apk --release

# # Commande par défaut pour lancer l'application (changez-la selon vos besoins)
# CMD ["flutter", "run"]
