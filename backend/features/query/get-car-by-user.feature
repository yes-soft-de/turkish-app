Feature: Get car by user
  Scenario: Get car via created by
    Given I am signed in user
    When I request the cars of valid user
    Then I expect response code "200"
    And A json response with the requested cars information