Feature: Create a project
  As a logged in user
  I can create a new project
  In order to create a project

  Scenario: Creating a project as a logged in user
    Given that I am logged in
    And there are 1 project categories
    When I go to the project create page
    Then I can create a project
    Then I see the project details
    Then the project location is geocoded

  Scenario: Creating a project as an anonymous user
    Given that I am not logged in
    When I go to the project create page
    Then I am redirected to the signup page
