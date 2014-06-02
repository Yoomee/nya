Feature: Project posts
  As logged in user
  I want to be read, post and comment on project
  In order to provide help and encouragement


  Scenario: Reading posts on a project
    Given a project
    And that the project has 3 posts
    When I go to the project
    Then I see the posts on the project

  Scenario: Posting on a project
    Given a project
    And that I am logged in
    When I go to the project
    Then I can post on the project
    And I should see my post
