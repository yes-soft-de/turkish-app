Feature: Register a new device
  Scenario: Register a new device in the application
    Given I am signed in user
    And I have valid device data
    When I request create a new device with the data I have
    Then I expect response code "200"
    And A json response with the new device information