Feature: Get all the reactions of a user
  Scenario: Get all the reactions by user Id
    Given I am signed in user
    When I request all my interactions
    Then I expect a response with list of all required reactions