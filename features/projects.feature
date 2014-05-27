Feature: Discovering projects
  As a visitor to the website
  I want to see a list of projects
  In order to see projects available

  Scenario: Viewing a list of projects
    Given there are 3 projects
    When I go to the list of projects
    Then I see the projects
