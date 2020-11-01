Feature: Get a car by user
  Scenario: Get a car via created by
    Given I am signed in user
    When I request the cars of valid user
    Then I expect response code "200"
    And A json response with the requested cars information