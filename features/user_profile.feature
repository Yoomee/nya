Feature: Update my profile
  As a registered user
  I want to be able to update my profile
  In order to show the right information about myself

  Scenario: Updating my location
    Given that I am logged in
    And my user profile has no location
    When I go to the user profile
    And complete the add location form
    Then my location is displayed on my profile page

  Scenario: Not seeing add location form when I have a location
    Given that I am logged in
    And my user profile has a location
    When I go to the user profile
    Then there is no add location form
    And my location is displayed on my profile page
