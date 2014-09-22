Feature: Blog
  As an admin
  I want to create, update and delete blog posts
  In order provide information

  Scenario: Creating a new blog post
    Given that I am logged in as an admin
    When I go to the admin area
    When I click on the "New blog post" link
    And I fill in the blog form appropriately
    Then I should see the blog post

  Scenario: Editing a blog post
    Given that I am logged in as an admin
    And that there is 1 blog post
    When I go to edit the blog post
    And I update the blog post
    Then I should see the blog post

  Scenario: Deleting a page
    Given that I am logged in as an admin
    And that there are 3 blog posts
    When I go to the first blog post
    And I click on the 'delete' link
    Then the blog post should be deleted
