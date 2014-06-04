Feature: View user profiles
  As a visitor to the website
  I want to see a user's profile
  In order to find out more about the user

  Scenario: Viewing a user profile
    Given a user
    When I go to the user profile
    Then I see the user details

  Scenario: Viewing a user's projects
    Given a user
    And the user has 2 created projects
    And the user has 2 owned projects
    When I go to the user profile
    Then I see the user's projects

