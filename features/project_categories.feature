Feature: Browsing projects by category
  In order to see projects available
  As a visitor to the website
  I can see projects by category

  Scenario: Viewing a list of projects by category
    Given a list of project categories
    When I go to the list of projects
    And I select a project category
    Then I can see projects for the selected category
