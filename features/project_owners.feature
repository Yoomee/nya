Feature: Project owners can manage projects they own
  As a project owner (not the project creator)
  I want to update, add owners and post blogs on the project
  In order to keep the project up to date

  Scenario: Editing the project
    Given that I am logged in
    And that I am an owner of 1 project
    When I go to edit the project
    And I update the project
    Then I see the project details

  Scenario: I can't delete the project
    Given that I am logged in
    And that I am an owner of 1 project
    When I go to the project
    Then I cannot see a link to delete the project

  Scenario: Adding another owner to the project
    Given there are 3 users
    And that I am logged in
    And that I am an owner of 1 project
    When I go to the project owners page
    Then I can add a user to my project
    And that user is an owner of my project

  @javascript
  Scenario: Posting a blog post on a project
    Given that I am logged in
    And that I have 1 project
    When I go to the project
    Then I can post a blog post on the project
    And I should see my blog post

  @javascript
  Scenario: I can delete a blog post from my project
    Given that I am logged in
    And that I have 1 project
    And my project has a blog post
    When I go to the project
    Then I should be able to delete my blog post
    And my blog post should be deleted
