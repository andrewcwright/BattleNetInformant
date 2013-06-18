Feature: Users can view base stats of a character
  In order to view base stats of a character
  As a user
  I want to visit the index page and see base stats of each character

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
    And I should see "Strength"
    And I should see "Agility"
    And I should see "Stamina"
    And I should see "Intellect"
    And I should see "Spirit"
    And I should see "Mastery"