Feature: Users can go to the versus page and enter a second character
  In order to compare two characters
  As a user
  I want to click a versus link for a character and be able to enter another character

  Scenario: Happy Path
    Given the user "acw462@gmail.com" with password "password"
    When I go to the homepage
    And I click "Login"
    And I fill in "acw462@gmail.com" for "Email"
    And I fill in "password" for "Password"
    And I press "Sign in"
    And I fill in "Andose" for "character_name"
    And I fill in "kelthuzad" for "character_realm"
    And I press "Submit"
    And I press "Andose - Kel'Thuzad - Nightfall"
    And I press "Versus"
    And I fill in "Infernae" for "Name"
    And I fill in "kelthuzad" for "Realm"
    And I click "Submit"
    Then I should see "Andose"
    And I should see "Infernae"
    And I should see "has higher health"
    And I should see "has higher damage"
    And I should see "has higher healing"