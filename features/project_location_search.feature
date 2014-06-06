Feature: Search by location
  As a user
  I can search for projects nearby
  In order to find projects near me

  @javascript
  Scenario: Search for projects nearby
    Given a project
    And there are 20 projects
    And 4 projects far away
    When I go to the project
    And I click on the "location-search-link" link
    Then there are 20 projects on the page
