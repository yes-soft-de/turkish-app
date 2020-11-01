Feature: Get all registered devices
  Scenario: Get all devices
    Given I have access to backend
    When I request all devices
    Then I expect response code "200"
    And A list of all available devices