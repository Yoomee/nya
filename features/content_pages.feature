Feature: Content pages
  In order find out information 
  As an anonymous user
  I want to see some pages

  Scenario: Viewing the about page
    Given there is an about page
    When I go to the about page
    Then I should see the about page
