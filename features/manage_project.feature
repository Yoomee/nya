Feature: Manage a project
  As a project creator
  I can edit my existing project
  In order to update the information

  Scenario: Editing a project as a project creator
    Given that I am logged in
    And I have created a project
    When I go to the project
    And I click on the "Edit" link
    Then I can update the project

  Scenario: Editing a project as an anonymous user
    Given a project
    When I go to the project
    Then I cannot see an "Edit" link

  Scenario: Editing a project as a logged in user
    Given that I am logged in
    And a project that I did not create
    When I go to the project
    Then I cannot see an "Edit" link
