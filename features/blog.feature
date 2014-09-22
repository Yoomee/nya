Feature: Blog
  As a guest
  I want to view blog posts
  In order learn about the site

  Scenario: Viewing an individual blog post
    Given that there is 1 blog post
    When I go to the blog post
    Then I should see the blog post

  Scenario: Viewing a list of the blog post
    Given that there is 2 blog posts
    When I go to the blog page
    Then I should see all the blog posts

