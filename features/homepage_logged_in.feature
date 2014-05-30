Feature: Home page
  As a logged in user
  I want to be see the homepage
  In order to be able to get an idea of what's going on

  Scenario: Viewing the homepage
    Given that I am logged in
    When I go to the homepage
    Then I should see the homepage
