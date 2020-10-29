Feature: Get a car by Id
  Scenario: Get a car by valid Id
    Given I am signed in user
    When I request a car by ID "1"
    Then I expect response code "200"
    And A json response with the car information