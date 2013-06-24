Feature: User can delete a character
  In order to delete a character
  As a user
  I want to click a delete link and not see that character anymore

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
    Then I should see "Andose - Kel'Thuzad - Nightfall"
    And I click "Andose - Kel'Thuzad - Nightfall"
    And I click "Delete"
    Then I should not see "Andose"