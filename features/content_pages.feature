Feature: Content pages
  As an anonymous user
  I want to see some pages
  In order find out information

  Scenario: Viewing the about page
    Given there is an about page
    When I go to the about page
    Then I should see the about page

  @email
  Scenario: Sending a message to the site owners
    Given there is a contact page
    And there is a thanks page
    When I go to the contact page
    And I submit the contact form
    Then I should see the thank you page
    And it should send a "new message from the contact page" email
