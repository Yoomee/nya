Feature: Forum
  As logged in user
  I want to be read, post and comment in a forum
  In order to be part of the community

  Scenario: Viewing the sport forums
    Given there is a "sport" forum
    When I go to the "sport" forum
    Then I should see the sport forum

  Scenario: Anonymous users should not be able to post to a forum
    Given there is a "sport" forum
    When I go to the "sport" forum
    Then I should not see a form to post a message
    And I should not see a form to post a comment

