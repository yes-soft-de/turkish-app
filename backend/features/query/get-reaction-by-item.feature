Feature: Get the reactions of a property
  Scenario: Get the reactions of a property and via entity
    Given I am signed in user
    And I have the entity value "car"
    When I request the reactions of an item with Id "3"
    Then I expect a response with list of all required reactions