Feature: Project Categories Admin
  As an admin
  I want to create, update and delete project categories
  In order to let users discover projects

    Scenario: Creating a project category
      Given that I am logged in as an admin
      When I go to the new project category page
      And I fill in the project category form
      Then I should see the new project category

    Scenario: Editing a project category
      Given that I am logged in as an admin
      And there is an art project category
      When I go to edit the art project category
      And I update the art project category
      Then I should see the art project category

    Scenario: Deleting a project category
      Given that I am logged in as an admin
      And there are 3 project categories
      And there is an art project category
      When I go to the art project category
      And I click on the 'delete' link
      Then the art project category should be deleted
      And I should see a list of all the project categories
