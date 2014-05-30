Feature: Home page
  As an anonymous user
  I want to be see the homepage
  In order to be able to get an idea of what's going on

  Scenario: Viewing the homepage
    When I go to the homepage
    Then I should see the homepage

  Scenario: Viewing project categories on the homepage
    Given there are 3 project categories
    When I go to the homepage
    Then I should see the project categories on the homepage

  Scenario: Viewing project categories on the homepage
    Given there are 3 project categories
    And each project category has 5 projects
    When I go to the homepage
    Then I should see the most recent projects on the homepage
