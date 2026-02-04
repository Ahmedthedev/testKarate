Feature: Correction de test Petstore

Background:
  * url 'https://petstore.swagger.io/v2'

Scenario: Récupérer un animal par son ID
  # ÉTAPE 1 : Récupérer un animal disponible
  Given path 'pet/findByStatus?status=available'
  When method GET
  Then status 200
  
  # On extrait l'ID du premier animal de la liste
  * def petId = response[0].id
  * print 'ID récupéré :', petId
  
  # ÉTAPE 2 : Récupérer cet animal spécifiquement
  Given path 'pet', 'petId'
  When method GET
  Then status 200
  
  # ÉTAPE 3 : Validation
  And match response.id == petId
  And match response.name == #string
  
  -------------------------------------------

  Feature: Correction de test Petstore

Background:
  * url 'https://petstore.swagger.io/v2'

Scenario: Récupérer un animal par son ID
  # ÉTAPE 1 : Récupérer un animal disponible
  # ERREUR 1 : On ne met pas les Query Params dans le 'path'
  # SOLUTION : Utiliser le mot-clé 'param'
  Given path 'pet/findByStatus'
  And param status = 'available'
  When method GET
  Then status 200
  
  # On extrait l'ID du premier animal de la liste
  # Rappel : response est une liste [], donc on accède au premier avec [0]
  * def petId = response[0].id
  * print 'ID récupéré :', petId
  
  # ÉTAPE 2 : Récupérer cet animal spécifiquement
  Given path 'pet', 'petId'
  When method GET
  Then status 200
  
  # ÉTAPE 3 : Validation
  And match response.id == petId
  And match response.name == #string
