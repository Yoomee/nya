Feature: Forum
  As logged in user
  I want to be read, post and comment in a forum
  In order to be part of the community

  Scenario: I should be able to read messages
    Given there is a "sport" forum
    And there are 3 messages in the "sport" forum
    When I go to the "sport" forum
    Then I should be see the 3 messages in the "sport" forum


  Scenario: I can post a new message to a forum and then read it
    Given there is a "sport" forum
    And that I am logged in
    When I go to the "sport" forum
    Then I should be able to post a message
    And I should be able to read my message
