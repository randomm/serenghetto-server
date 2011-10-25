Feature: Add new barcode
  In order to play the game 
  A user
  Should be able to view their own and other players' barcode scans

#  Background:
#    Given I am a user named "foo" with an email "user@test.com" and password "please"
#    And I accept JSON
#    When I post my email "user@test.com" and password "please" to "/api/session"
#    Then I debug
#    Then the response status should be "201"

    @dev
    Scenario: Logged in user lists their barcodes
      Given I am a registered user
      And I accept JSON
      And I log in
      When I request a list of barcodes I have submitted to the system
      Then the response status should be "201"
      And response JSON has valid schema