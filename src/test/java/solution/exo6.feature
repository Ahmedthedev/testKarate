Feature: Atelier Pratique - Gestion du cycle de vie d'un Pet

Background:
  # TODO: Renseigner l'URL de base de l'API Petstore (v2)
* ______ __________________
# ---------------------------------------------------------
# EXO 1 : Créer un animal (POST)
# ---------------------------------------------------------
Scenario: Création d'un nouveau chien
  Given path "pet"
  # TODO: Ajouter le mot-clé pour envoyer un corps de requête
  And ______
  """
  {
    "id": 2026,
    "name": "Lucky",
    "status": "available"
  }
  """
  # TODO: Indiquer la méthode HTTP pour la création
  When method ______
  # TODO: Vérifier que le code statut est celui d'un succès (200)
  Then status ______
  And match response.name == "Lucky"

# ---------------------------------------------------------
# EXO 2 : Récupérer l'animal (GET)
# ---------------------------------------------------------
Scenario: Vérifier que l'animal existe bien
  # TODO: Compléter le chemin pour cibler l'animal avec l'ID 2026
  Given path "pet", "______"
  When method get
  Then status 200
  And match response.id == 2026

# ---------------------------------------------------------
# EXO 3 : Modifier le statut (PUT)
# ---------------------------------------------------------
Scenario: Mettre à jour le statut de Lucky en 'sold'
  Given path "pet"
  And request 
  """
  {
    "id": 2026,
    "name": "Lucky",
    "status": "______"
  }
  """
  # TODO: Indiquer la méthode HTTP pour la mise à jour
  When method ______
  Then status 200
  And match response.status == "sold"

# ---------------------------------------------------------
# EXO 4 : Supprimer l'animal (DELETE)
# ---------------------------------------------------------
Scenario: Supprimer l'animal pour nettoyer les données
  # TODO: Construire le chemin vers /pet/2026
  Given path "______", "2026"
  When method ______
  Then status 200
  # TODO: Vérifier que le message de réponse contient l'ID supprimé
  And match response.message == "______"

* print "Quel boss tu es c'est un sans faute que tu viens de faire la !"