Feature: Admin area

  Scenario: I should be able to see the admin area if I'm an admin
    Given that I am logged in as an admin
    When I go to the admin area
    Then I should see the admin area

  @allow-rescue
  Scenario: I should be not able to see the admin area if I'm not an admin
    Given that I am logged in
    When I go to the admin area
    Then I should see the access denied page

  @allow-rescue
  Scenario: I should be not able to see the admin area if I'm not logged in
    Given that I am not logged in
    When I go to the admin area
    Then I should see the access denied page
