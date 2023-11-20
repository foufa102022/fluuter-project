# Utilisez une image Flutter en tant qu'image de base
FROM cirrusci/flutter:2.10.2

# Copiez les fichiers nécessaires dans le conteneur
WORKDIR /app
COPY . .

# Obtenez les dépendances du projet
RUN flutter pub get

# Construisez l'application Flutter
RUN flutter build apk --release

# Commande par défaut pour lancer l'application (changez-la selon vos besoins)
CMD ["flutter", "run"]
