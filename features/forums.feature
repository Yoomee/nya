Feature: Forums
  As an anonymous user
  I want to be able to read the forums
  In order to be able to get an idea of what's going on

  Scenario: Viewing the home page for forums
    When I go to the home page for forums
    Then I should see the home page for forums

  Scenario: Viewing the sport forums
    Given there is a "sport" forum
    When I go to the "sport" forum
    Then I should see the sport forum

  Scenario: Anonymous users should not be able to post to a forum
    Given there is a "sport" forum
    When I go to the "sport" forum
    Then I should not see a form to post a message
    And I should not see a form to post a comment
