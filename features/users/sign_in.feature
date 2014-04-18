Feature: Sign in
  In order to get access to protected sections of the site
  A user
  Should be able to sign in

  Scenario: User is not signed up
    Given I do not exist as a user
    When I sign in with valid credentials
    Then I see an invalid login message
    And I should be signed out

  Scenario: User signs in successfully using his email
    Given I exist as a user
    And I am not logged in
    When I sign in with valid credentials
    Then I see a successful sign in message
    When I return to the site
    Then I should be signed in
    And I should be on the wizard index page

  Scenario: User signs in successfully using his username
    Given I exist as a user
    And I am not logged in
    When I sign in with valid credentials using my username
    Then I see a successful sign in message
    When I return to the site
    Then I should be signed in

  Scenario: Forgot password

  Scenario: Resend confirmation email


