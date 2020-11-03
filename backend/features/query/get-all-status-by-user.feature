Feature: Get a status by user
  Scenario: Get a status via created by
    Given I am signed in user
    When I request the status of valid user
    Then I expect response code "200"
    And A json response with the requested status information