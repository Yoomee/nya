Feature: Forums
  As an admin
  I want to be able to feature projects on the homepage and on forum pages
  In order to allow users to see high quality projects

    Scenario: Featuring a project
    Given a project
    And that I am logged in as an admin
    When I go edit to the project
    Then I should be able to feature the project on the homepage
    Then I should see the project on the homepage
