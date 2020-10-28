Feature: Get car by user
  Scenario: Get car via created by
    Given I have access to backend
    When I request get car by valid created by
    Then I expect response code "200"
    And A json response with the requested car information