Feature: Admin page

  Scenario: I should be able to see the admin page if I'm an admin
    Given that I am logged in as an admin
    When I go to the admin page
    Then I should see the admin page

  @allow-rescue
  Scenario: I should be not able to see the admin page if I'm not an admin
    Given that I am logged in
    When I go to the admin page
    Then I should see the access denied page

  @allow-rescue
  Scenario: I should be not able to see the admin page if I'm not logged in
    Given that I am not logged in
    When I go to the admin page
    Then I should see the access denied page
