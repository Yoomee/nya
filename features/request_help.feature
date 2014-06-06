Feature: Requesting help from a user
  As a project creator
  I can request help from a user for my projects
  In order to get help from people

  @javascript
  Scenario: Requesting help on a project
    Given that I am logged in
    And I have created a project
    And a user
    When I go to the user profile
    And I click on the "request-link" link
    When I submit the help form
    Then I should see the thank you message
