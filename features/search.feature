Feature: Content pages
  As an anonymous user
  I want to search the projects
  In order be able to find a project

  Scenario: Search for a project
  Given there are 5 projects
  When I enter "title" in the search box
  Then I will see the projects for the search "title"
