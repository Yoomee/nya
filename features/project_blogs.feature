Feature: Project posts
  As project owner
  I want to post a blog on my project
  In order to provide updates on my progress

  Scenario: Reading blog posts on a project
    Given a project
    And that the project has 3 blog posts
    When I go to the project
    Then I see the blog posts on the project

  @javascript
  Scenario: Posting on a project
    Given that I am logged in
    And that I have 1 project
    When I go to the project
    Then I can post a blog post on the project
    And I should see my blog post

  Scenario: I can't post a blog on a project that isn't mine
    Given a project
    And that I am logged in
    When I go to the project
    Then I cannot post a blog post on the project

  @javascript
  Scenario: I can delete a blog post from my project
    Given that I am logged in
    And that I have 1 project
    And my project has a blog post
    When I go to the project
    Then I should be able to delete my blog post
    And my blog post should be deleted
