Feature: Create a new user profile
  Scenario: Create a new user profile with valid data
    Given I have access to backend
    And I have valid new profile data
    When I request create a profile with the data I have
    Then I expect response code "200"
    And A json response with the profile information