Feature: Get all registered cars
  Scenario: Get all cars
    Given I have access to backend
    When I request all cars
    Then I expect response code "200"
    And A list of all available cars