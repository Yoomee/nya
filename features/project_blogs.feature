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
