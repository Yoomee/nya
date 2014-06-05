Feature: Content pages
  As an anonymous user
  I want to search the projects
  In order be able to find a project

  Scenario: Search for a project
  Given there are 5 projects
  When I enter "title" in the search box
  Then I will see the projects for the search "title"

  @javascript
  Scenario: Search for a project with different tags
  Given there are 5 projects
  And the projects have different tags
  When I enter "title" in the search box
  And I filter by one of the tags
  Then I will see the projects for the search "title" with the correct tags
