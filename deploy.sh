#!/bin/bash

set -e  # stoppe le script si une commande échoue

echo "Déploiement de Weight Tracker en cours..."

# Aller dans le dossier du script (pratique si tu lances depuis ailleurs)
cd "$(dirname "$0")"

echo "Mise à jour du dépôt..."
git pull origin main

echo "Reconstruction des images..."
docker-compose build

echo "Relance des conteneurs..."
docker-compose up -d

echo "Nettoyage des anciennes images inutilisées..."
docker image prune -f

echo "Déploiement terminé !"
