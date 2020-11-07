Feature: Insert a new reaction
  Scenario: Insert a new reaction for specific property
    Given I am signed in user
    And I have valid reaction data
    When I request create a new reaction with the data I have
    Then I expect response code "200"
    And A json response with the new reaction information