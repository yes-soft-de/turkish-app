Feature: Get a device by Id
  Scenario: Get a device by valid Id
    Given I am signed in user
    When I request a device by ID "10"
    Then I expect response code "200"
    And A json response with the device information