Feature: Get a real estate by user
  Scenario: Get a real estate via created by
    Given I am signed in user
    When I request the real estates of valid user
    Then I expect response code "200"
    And A json response with the requested real estates information