Feature: As a user,
  I can scan a qr code and send feedback to a company

  Background:
    Given I have an item

  Scenario: As a user I scan a qr code and submit feedback
    Given I am on the QR code landing page
    When I click the feedback button
      And I submit my feedback
    Then a new feedback should have been created
      And I should see the thank you message

