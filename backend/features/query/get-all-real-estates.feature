Feature: Get all registered real estates
  Scenario: Get all real estates
    Given I have access to backend
    When I request all real estates
    Then I expect response code "200"
    And A list of all available real estates