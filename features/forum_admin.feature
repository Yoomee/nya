Feature: Forums
  As an admin
  I want to create, update and delete forums
  In order to allow users to communicate and share information

    Scenario: Creating a new forum
    Given that I am logged in as an admin
    When I go to the new forum page
    And I fill in the forum form appropriately
    Then I should see the new forum

    Scenario: Editing a forum
    Given that I am logged in as an admin
    And there is a "sport" forum
    When I go to edit the "sport" forum
    And I update the sport forum
    Then I should see the updated sport forum

    Scenario: Deleting a forum
    Given that I am logged in as an admin
    And there are 3 forums
    And there is a "sport" forum
    When I go to the "sport" forum
    And I click on the forum 'delete' link
    Then the sport forum should be deleted
    And I should see the manage page for forums

    Scenario: Viewing all forums
    Given that I am logged in as an admin
    And there are 3 forums
    When I go to manage the forums
    Then I should see all the forums

    Scenario: Adding a project_category to a forum
    Given that I am logged in as an admin
    And there is a "sport" forum
    And there are 5 projects in a project category
    When I go to edit the "sport" forum
    And I add the project category to the forum
    Then the forum should show the latest projects from the project category
