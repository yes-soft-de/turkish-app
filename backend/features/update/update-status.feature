Feature: Update an existing status
  Scenario: update an existing status by id
    Given I am signed in user
    And I have a valid status update request of ID "44"
    When I request update a status
    Then I expect the response update successfully
    And I expect the updated status match the data