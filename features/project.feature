Feature: View project page
  In order to find out more about a project
  As a visitor to the website
  I want to see a project

  Scenario: Viewing a project
    Given a project
    When I go to the project
    Then I see the project details 
