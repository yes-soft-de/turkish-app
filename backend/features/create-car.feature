Feature: Register a new car
  Scenario: Register a new car in the application
    Given I have access to backend
    And I have valid car data
    When I request create a new car with the data I have
    Then I expect response code "200"
    And A json response with the new car information