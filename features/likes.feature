Feature: Users can like projects
  As a user
  I can like a project
  In order to encourage the project creator

  @javascript
  Scenario: Liking a project on the listing page
    Given that I am logged in
    And a project
    When I go to the list of projects
    And I click on the like link for the project
    Then the project like count is increased by one

  @javascript
  Scenario: Liking a project on the project page
    Given that I am logged in
    And a project
    When I go to the project
    And I click on the like link for the project
    Then the project page like count is increased by one
