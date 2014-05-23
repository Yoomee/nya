Feature: Create a project
  In order to create a project
  As a logged in user
  I can create a new project

  Scenario: Creating a project as a logged in user
    Given that I am logged in
    When I go to the project create page
    Then I can create a project
    Then I should see the show project page

  Scenario: Creating a project as an anonymous user
    Given that I am not logged in
    When I go to the project create page
    Then I be redirected to the signup page
