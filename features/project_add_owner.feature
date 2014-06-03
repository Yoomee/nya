Feature: Project posts
  As project creator
  I want to add and remove owners of my project
  In order to allow other people to help with my project

  Scenario: My project has an add & remove owners link
    Given that I am logged in
    And that I have 1 project
    When I go to the project
    Then I can see a link to add owners

  Scenario: I can go to the owners page
    Given that I am logged in
    And that I have 1 project
    When I go to the project
    And I click on the "Add & remove owners" link
    Then I am on the owners page for my project

  Scenario: I can add owners
    Given there are 3 users
    And that I am logged in
    And that I have 1 project
    When I go to the project owners page
    Then I can add a user to my project
    And that user is an owner of my project

  Scenario: I can remove owners
    And that I am logged in
    And that I have a project with another owner
    When I go to the project owners page
    Then I can remove the user from my project
    And that user is no longer an owner of my project

