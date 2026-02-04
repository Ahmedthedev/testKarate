Feature: Gestion des commandes
Background : 
*URL ”MON_URL”
Scenario: Vérifier une commande existante 
Given path ”MON_PATH” 
And param MON_PARAM = PARAM_VALEUR
When method get 
Then status 200
And match == “#present”

Feature: Gestion des commandes Petstore

Background:
  * url "https://petstore.swagger.io/v2"

Scenario: Vérifier une commande existante
  # On définit l'ID de la commande à récupérer
  Given path "store", "order", "1"
  When method get
  Then status 200
  
  # Validations des données reçues
  And match response.id == 1
  And match response.petId == "#number"
  And match response.status == "#string"
  
  # Vérifie que le champ 'complete' est présent (booléen)
  And match response.complete == "#present"
