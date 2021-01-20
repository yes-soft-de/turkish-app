Feature: Get a status of logged in user by Id
  Scenario: Get a status by valid Id
    Given I am signed in user
    When I request a status by ID "65"
    Then I expect response code "200"
    And A json response with the status information