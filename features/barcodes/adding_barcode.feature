Feature: Add new barcode
  In order to play the game 
  A user
  Should be able to add new barcodes into the system

  Background:
    Given I am a user named "foo" with an email "user@test.com" and password "please"
    And I accept JSON
    When I post my email "user@test.com" and password "please" to "/api/session"
#    Then I debug
    Then the response status should be "201"

    @dev
    Scenario: User posts new barcode via HTTP API with name and code but no location
      Given I accept JSON
      When I send a new barcode via HTTP API with the following:
        |barcode[name]|barcode[code]|
        |test name|0123456789|
      Then the response status should be "201"
      And response JSON has valid schema
      
    @dev
    Scenario: User posts new barcode via HTTP API with name but no code
      Given I accept JSON
      When I send a new barcode via HTTP API with the following:
        |barcode[name]|barcode[foo]|
        |test name|bar|
      Then the response status should be "403"
      And response JSON has valid schema
      
