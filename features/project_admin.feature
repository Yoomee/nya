Feature: Project admin
  As project creator
  I want to be able to update and delete my project
  In order keep my project current

  Scenario: Deleting a project I created
    Given that I am logged in
    And that I have 1 project
    When I go to the project
    And I click on the "Delete" link
    Then my project should be deleted
