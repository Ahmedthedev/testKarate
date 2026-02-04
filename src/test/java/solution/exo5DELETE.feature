Feature: Exercice 5 - Suppression (DELETE)

Background:
  * url "https://petstore.swagger.io/v2"

Scenario: Supprimer une commande spécifique
  # On cible l'ID 101 que nous avons potentiellement créé à l'exo 3
  Given path "store", "order", "101"
  When method delete
  Then status 200
  
  # Validation du message de confirmation de l'API
  And match response.message == "101"


Scenario: Vérifier qu'une commande inexistante renvoie 404
  Given path "store", "order", "999999" # Un ID qui n'existe sûrement pas
  When method get
  Then status 404
  And match response.message == "Order not found"