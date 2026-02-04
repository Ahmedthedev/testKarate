Feature: Récupérer les animaux disponibles dans le Petstore
Background:

url 'https://petstore.swagger.io/v2'

Scenario: Récupérer tous les animaux disponibles
Given path 'pet/findByStatus'
And param status = 'available'
When method GET
Then status 200
And match response == '#array'
And match response == '#[_ > 0]'
