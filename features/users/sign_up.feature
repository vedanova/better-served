Feature: Sign up
  In order to get access to protected sections of the site
  As a user
  I want to be able to sign up
  I should not be able to signup unless I have the url as it is not linked

    Background:
      #Given I am not logged in

    Scenario: User signs up with valid data and logs in should be on the wizard page
      And I sign up with valid user data
      Then I should see a successful sign up message
        And I should receive an email
        And there should have been an organisation with name "Acme" created
        And I open the email with subject "Confirmation instructions"
        And I click the first link in the email
        Then I should be confirmed
        And I should see a successful confirmation message
        And I should be on the login page

      
    Scenario: User signs up with invalid email
      When I sign up with an invalid email
      Then I should see an invalid email message

    Scenario: User signs up without password
      When I sign up without a password
      Then I should see a missing password message

    Scenario: User signs up without password confirmation
      When I sign up without a password confirmation
      Then I should see a missing password confirmation message

    Scenario: User signs up with mismatched password and confirmation
      When I sign up with a mismatched password confirmation
      Then I should see a mismatched password message


    Scenario: User signs up without an organisation
       When I sign up without an organisation
       Then I should see a missing organisation message
