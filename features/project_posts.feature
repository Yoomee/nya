Feature: Project posts
  As logged in user
  I want to be read, post and comment on project
  In order to provide help and encouragement

  Scenario: Reading posts on a project
    Given a project
    And that the project has 3 posts
    When I go to the project
    Then I see the posts on the project

  @javascript
  Scenario: Posting on a project
    Given a project
    And that I am logged in
    When I go to the project
    Then I can post on the project
    And I should see my post

  @javascript
  Scenario: I can delete my own post from a project
    Given a project
    And that I am logged in
    And that the project has 3 posts
    And that I have posted on the project
    When I go to the project
    Then I should be able to delete my post
    And my post should be deleted

  @javascript
  Scenario: I can comment on another post on a project
    Given a project
    And that I am logged in
    And that the project has 3 posts
    When I go to the project
    Then I should be able to comment on a post
    And I should see my comment
