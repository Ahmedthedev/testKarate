#!/bin/bash
echo "🚀 Initialisation de l'environnement Karate..."
cd /workspaces/testKarate/karate-tests
# On s'assure que les dépendances sont là et on lance un test à vide
mvn clean compile -DforkCount=0
echo "Environnement prêt !"
