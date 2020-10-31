Feature: Get a real estate by Id
  Scenario: Get a real estate by valid Id
    Given I am signed in user
    When I request a real estate by ID "6"
    Then I expect response code "200"
    And A json response with the real estate information