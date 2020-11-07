Feature: Register a new real-estate
  Scenario: Register a new real-estate in the application
    Given I am signed in user
    And I have valid real-estate data
    When I request create a new real-estate with the data I have
    Then I expect response code "200"
    And A json response with the new real-estate information