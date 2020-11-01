Feature: Update an existing realEstate
  Scenario: update an existing realEstate by id
    Given I am signed in user
    And I have a valid realEstate update request of ID "7"
    When I request update a realEstate
    Then I expect the response update successfully
    And I expect the updated realEstate match the data