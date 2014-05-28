Feature: Project Categories Admin
  As an admin
  I want to create, update and delete project categories
  In order to let users discover projects

    Scenario: Creating a project category
      Given that I am logged in as an admin
      When I go to the new project category page
      And I fill in the project category form
      Then I should see the project category

    Scenario: Editing a project category
      Given that I am logged in as an admin
      And there is an art project category
      When I go to edit the project category
      And I update the project category
      Then I should see the project category

    Scenario: Deleting a project category
      Given that I am logged in as an admin
      And there are 3 project categories
      And there are 3 projects
      And there is an art project category
      When I go to edit the project category
      And I click on the 'delete' button
      Then the project category should be deleted
      And I see the projects

    Scenario: Deleting a project category that has projects
      Given that I am logged in as an admin
      And there are 3 project categories
      And there are 3 projects
      And there is an art project category
      And the project category has at least 1 project
      When I go to edit the project category
      And I click on the 'delete' button
      Then the project category should not be deleted
