Feature: Users can go to the progression page and view a list of raids and number of bosses killed
  In order to view progression through raids
  As a user
  I want to click a progression link for each character and view the number of bosses killed in each difficulty level

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
    And I press "Progression"
    And I fill in "Dragon Soul" for "Enter raid here"
    And I click "Submit"
    And I click "Dragon Soul"
    Then I should see "Dragon Soul"
    And I should see "LFR Kills"
    And I should see "Normal Kills"
    And I should see "Heroic Kills"