Feature: ceci est un test

Scenario: get all store

Given url "https://petstore.swagger.io/v2/store/inventory"
When method get
Then status 200
* print 'ma super response -> ', response ,'<- ma super response'
And match response == "#present"
