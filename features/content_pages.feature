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
