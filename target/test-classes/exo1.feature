Feature: Récupérer les animaux disponibles dans le Petstore

Background:
  * url 'https://petstore.swagger.io/v2'

Scenario: Récupérer tous les animaux disponibles
  # TODO: Ajouter le path 'pet/findByStatus'
  Given path 'pet/findByStatus'
  # TODO: Ajouter le paramètre status=available
  And param status = 'available'

  # TODO: Définir la méthode HTTP GET
  
  When method GET
  # TODO: Vérifier que le status est 200
  
  Then status 200
  # TODO: Vérifier que la réponse est un tableau (array)
  
  And match response == '#array'
  
  # TODO: Vérifier que le tableau n'est pas vide ->#[_ > 0]
  And match response == '#[_ > 0]'
  