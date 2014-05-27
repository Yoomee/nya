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
    And there is a sport forum
    When I go to edit the sport forum
    And I update the sport forum
    Then I should see the sport forum

    Scenario: Deleting a forum
    Given that I am logged in as an admin
    And there are 3 forums
    And there is a sport forum
    When I go to the sport forum
    And I click on the forum 'delete' link
    Then the sport forum should be deleted
    And I should see the home page for forums
