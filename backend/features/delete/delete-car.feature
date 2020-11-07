Feature: Delete a car
  Scenario: Delete a car by valid Id
    Given I have access to backend
    When I request delete a car of ID "11"
    Then I expect response code "200"
    And I expect message of delete successfully