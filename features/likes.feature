Feature: Users can like projects
  As a user
  I can like a project
  In order to encourage the project creator

  @javascript
  Scenario: Liking a project on the listing page
    Given that I am logged in
    And a project
    When I go to the list of projects
    And I click on the project like link
    Then the project like count is increased by one
