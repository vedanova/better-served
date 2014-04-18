Feature: As a user,
  I can scan a qr code and submit a request to a company

  Background:
    Given I have an item

  Scenario: As a user I want to send a request
    Given I am on the QR code landing page
      When I click the waiter button
    Then a new request should have been created
      And I should see the thank you message

