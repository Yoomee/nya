Feature: Helping on projects
  As a logged in user
  I want to offer my help on projects
  So that I can become involved

  @javascript
  Scenario: Offering to help on a project
    Given that I am logged in
    And a project
    When I go to the project
    And I click on the "link-help-1" link
    When I submit the contact form
    Then I should see the thank you message
    And the project should have a helper
