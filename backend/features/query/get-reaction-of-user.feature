Feature: Check if user reacted with an item

  Scenario: User reacted with specific item
    Given I have access to backend
    And I have the entity value "car"
    When I request check if user reacted with an item of ID "0"
    Then I expect a response with reaction information


  Scenario: User does not reacted with the item
    Given I have access to backend
    And I have the entity value "car"
    When I request check if user reacted with an item of ID "100"
    Then I get the Not Found response
    And A response with message data not found