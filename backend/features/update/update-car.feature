Feature: Update an existing car
  Scenario: update an existing car by id
    Given I am signed in user
    And I have a valid car update request of ID "2"
    When I request update a car
    Then I expect the response update successfully
    And I expect the updated car match the data
