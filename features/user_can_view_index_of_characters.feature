@wip
Feature: Users can view a list of all stored characters
  In order to view a list fo characters
  As a user
  I want to visit the index page and see a list of characters belonging to that user

  Scenario: Happy Path
    Given the user "acw462@gmail.com" with password "password"
    When I go to the homepage
    And I click "Log In"
    And I fill in "acw462@gmail.com" for "Email"
    And I fill in "password" for "Password"
    And I press "Sign in"
    And I fill in "Andose" for "character_name"
    And I fill in "kelthuzad" for "character_realm"
    And I press "Submit"
    Then I should see "Andose"
    And I should not see "Tacosofdeath"