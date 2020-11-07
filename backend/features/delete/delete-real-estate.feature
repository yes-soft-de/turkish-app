Feature: Delete a realEstate
  Scenario: Delete a realEstate by valid Id
    Given I have access to backend
    When I request delete a realEstate of ID "9"
    Then I expect response code "200"
    And I expect message of delete successfully