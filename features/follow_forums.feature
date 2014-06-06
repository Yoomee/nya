Feature: Following forums
  As a logged in user
  I can follow a forum
  In order to get the latest posts on my profile

  Scenario: A forum has a follow link
    Given there is a "sport" forum
    When I go to the "sport" forum
    Then I should be see a "Follow" link

  @javascript
  Scenario: Follow a forum
    Given there is a "sport" forum
    And that I am logged in
    And there are 10 messages in the "sport" forum
    When I go to the "sport" forum
    And I click on the "Follow" link
    Then I will follow the forum
    And I will see the forums I follow on my profile

  Scenario: Recent followers of a forum appear on the forum
    Given there is a "sport" forum
    And there are 10 followers of the "sport" forum
    When I go to the "sport" forum
    Then I will see the recent followers on the forum
