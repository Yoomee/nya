Feature: Forums
  In order to allow users to communicate and share information
  As an admin
  I want to create, update and delete forums

    Scenario: Creating a new forum
    Given that I am logged in as an admin
    When I go to the new forum page
    And I fill in the forum form appropriately
    Then I should see the new forum
