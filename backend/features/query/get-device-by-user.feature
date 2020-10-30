Feature: Get a device by user
  Scenario: Get a device via created by
    Given I am signed in user
    When I request the devices of valid user
    Then I expect response code "200"
    And A json response with the requested devices information