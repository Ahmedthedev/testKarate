Feature: Exercice 4 - Mise à jour d'un animal (PUT)

Background:
  * url "https://petstore.swagger.io/v2"

Scenario: Modifier les informations d'un animal existant
  Given path "pet"
  And request 
  """
  {
    "id": 98765,
    "category": { "id": 1, "name": "Dogs" },
    "name": "Snoopy",
    "status": "available"
  }
  """
  When method put
  Then status 200
  # On vérifie que le nom a bien été mis à jour
  And match response.name == "Snoopy"