Feature: Content pages
  In order find out information 
  As an anonymous user
  I want to see some pages


  Scenario: Viewing the about page
    Given there is an about page
    When I go to the about page
    Then I should see the about page

    Scenario: Creating a new page
    Given that I am logged in as an admin
    When I go to the new content_page page
    And I fill in the content_page form appropriately
    Then I should see the new page

    Scenario: Editing a page
    Given that I am logged in as an admin
    And there is an about page
    When I go to edit the about page
    And I update the about page
    Then I should see the about page

    Scenario: Deleting a page
    Given that I am logged in as an admin
    And there are 3 content_pages
    And there is an about page
    When I go to the about page
    And I click on the 'delete' link
    Then the about page should be deleted
    And I should see a list of all the pages

    Scenario: Listing all pages
    Given that I am logged in as an admin
    And there are 3 content_pages
    When I go to the admin page
    And I click on the 'Manage pages' link
    Then I should see a list of all the pages
