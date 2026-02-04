Feature: Exercice 3 - Création d'une commande (POST)

Background:
  * url "https://petstore.swagger.io/v2"

Scenario: Créer une nouvelle commande de pet
  Given path "store", "order"
  And request 
  """
  {
    "id": 101,
    "petId": 5,
    "quantity": 1,
    "shipDate": "2026-02-04T13:00:00.000Z",
    "status": "placed",
    "complete": true
  }
  """
  When method post
  Then status 200
  And match response.id == 101
  And match response.status == "placed"