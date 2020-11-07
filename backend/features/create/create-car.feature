Feature: Register a new car

  Scenario: Register a new car by signed in user
    Given I am signed in user
    And I have valid car data
    When I request create a new car with the data I have
    Then I expect response code "200"
    And A json response with the new car information

  Scenario: Register a new car by anonymous
    Given I am not signed in user
    And I have access to backend
    And I have valid car data
    When I request create a new car with the data I have
    Then I expect response code "401"
    And A json response with expired token