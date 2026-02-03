# Le mot-clé Feature définit le groupe de tests
Feature: Démonstration Karate sur l'API Petstore

Background:
  # Le Background s'exécute avant CHAQUE scenario.
  # Idéal pour définir l'URL de base ou des headers communs.
  * url 'https://petstore.swagger.io/v2'
  * header Accept = 'application/json'

Scenario: Créer un animal et vérifier son existence
  
  # --- ÉTAPE 1 : Création (POST) ---
  # 'path' s'ajoute à l'URL du background
  Given path 'pet'
  # 'request' définit le corps du message (pas besoin de guillemets autour des clés JSON !)
  And request 
  """
  {
    "name": "Mistigri",
    "category": { "id": 1, "name": "Chats" },
    "status": "available",
    "photoUrls": ["https://monchat.jpg"]
  }
  """
  # On déclenche l'appel
  When method post
  # Assertion simple du code HTTP
  Then status 200
  
  # --- ÉTAPE 2 : Manipulation de variables ---
  # On stocke l'ID généré par l'API dans une variable 'petId'
  # 'response' est un mot-clé magique qui contient le JSON reçu
  * def petId = response.id
  # On affiche l'ID dans la console pour débugger
  * print 'Le nouvel ID est :', petId

  # --- ÉTAPE 3 : Vérification (GET) ---
  # On réutilise la variable 'petId' directement dans le chemin
  Given path 'pet', petId
  When method get
  Then status 200
  
  # --- ÉTAPE 4 : Assertions avancées (Match) ---
  # On vérifie que le nom est exactement "Mistigri"
  And match response.name == 'Mistigri'
  
  # On vérifie le TYPE des données (Fuzzy Matching)
  # #number veut dire "doit être un nombre"
  # #array veut dire "doit être un tableau"
  And match response.id == '#number'
  And match response.photoUrls == '#array'
  
  # On vérifie la présence d'un élément dans une liste
  # On demande si "Chats" est présent dans le champ name de l'objet category
  And match response.category.name contains 'Chats'

  # Assertion de structure : l'objet doit avoir exactement ces clés
  # On utilise '##' pour dire "optionnel" (si le champ est absent, ça passe)
  And match response ==
  """
  {
    "id": '#number',
    "category": '#object',
    "name": '#string',
    "photoUrls": '#[]',
    "tags": '##[]',
    "status": '#string'
  }
  """