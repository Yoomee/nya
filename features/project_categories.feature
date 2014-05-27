Feature: Browsing projects by category
  As a visitor to the website
  I can see projects by category
  In order to see projects available

  Scenario: Viewing a list of projects by category
    Given there are 3 project categories
    And there are 3 projects
    When I go to the list of projects
    And I visit a project category
    Then I can see projects for the selected category
