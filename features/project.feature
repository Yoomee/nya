Feature: View project page
  As a visitor to the website
  I want to see a project
  In order to find out more about a project

  Scenario: Viewing a project
    Given a project
    When I go to the project
    Then I see the project details
