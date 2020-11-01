Feature: Save a new image
  Scenario: Save a new image for specific property
    Given I have access to backend
    And I have valid new image data
    When I request save a new image with the data I have
    Then I expect response code "200"
    And A json response with the new image information