Feature: Delete a device
  Scenario: Delete a device by valid Id
    Given I have access to backend
    When I request delete a device of ID "12"
    Then I expect response code "200"
    And I expect message of delete successfully