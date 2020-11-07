Feature: Create a new status
  Scenario: Create a new status between a client and lawyer
    Given I am signed in user
    And I have valid status data
    When I request create a new status with the data I have
    Then I expect response code "200"
    And A json response with the new status information