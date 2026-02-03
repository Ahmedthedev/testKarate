Feature: Test Interne
Scenario: Verifier que Karate fonctionne
    * def chat = { nom: 'Félix', age: 3 }
    * match chat.nom == 'Félix'
    * print 'Le moteur Karate fonctionne, le chat s\'appelle:', chat.nom
