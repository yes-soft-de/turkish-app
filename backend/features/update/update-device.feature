Feature: Update an existing device
  Scenario: update an existing device by id
    Given I am signed in user
    And I have a valid device update request of ID "10"
    When I request update a device
    Then I expect the response update successfully
    And I expect the updated device match the data