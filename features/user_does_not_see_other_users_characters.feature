Feature: Users can view a list of only their stored characters
  In order to view a list of associated characters
  As a user
  I want to login and see only my characters on the front page

  Scenario: Happy Path
    Given the user "acw462@gmail.com" with password "password"
    Given the user "bob@example.com" with password "password"
    When I go to the homepage
    And I click "Login"
    And I fill in "acw462@gmail.com" for "Email"
    And I fill in "password" for "Password"
    And I press "Sign in"
    And I fill in "Andose" for "character_name"
    And I fill in "kelthuzad" for "character_realm"
    And I press "Submit"
    And I press "Logout"
    And I click "Login"
    And I fill in "bob@example.com" for "Email"
    And I fill in "password" for "Password"
    And I press "Sign in"
    And I fill in "Infernae" for "character_name"
    And I fill in "kelthuzad" for "character_realm"
    And I press "Submit"
    Then I should see "Infernae"
    And I should not see "Andose"