Feature: login by a user
  Scenario: login via valid user data
    Given I have access to backend
    And I have valid user credentials
    When I request login check
    Then I expect response code "200"
    And I expect a token within the response