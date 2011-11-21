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

    Scenario: User posts new barcode via HTTP API with name and code but no location
      Given I accept JSON
      When I send a new barcode via HTTP API with the following:
        |barcode[name]|barcode[code]|
        |test name|0123456789|
      Then the response status should be "201"
      And response JSON has valid schema
      And response has all required fields
      
    Scenario: User posts new barcode via HTTP API with name and location but no code
      Given I accept JSON
      When I send a new barcode via HTTP API with the following:
        |barcode[name]|barcode[foo]|
        |test name|bar|
      Then the response status should be "403"
      And response JSON has valid schema
      
    Scenario: User posts new barcode via HTTP API with name, code and full location
      Given I accept JSON
      When I send a new barcode via HTTP API with the following:
        |barcode[name]|barcode[code]|location[accuracy]|location[longitude]|location[latitude]|location[timestamp]|
        |test name|0123456789|1.0|61.12345|24.12345|1319193664123|
      Then the response status should be "201"
      And response JSON has valid schema
      And response has all required fields
      
    Scenario: User adds a code that already exists in the system 3 times and new score is calculated correctly
      Given I accept JSON
      When there are 3 barcodes with the same code 09876543210987654321 in the system
      And I send a new barcode via HTTP API with the following:
        |barcode[name]|barcode[code]|location[accuracy]|location[longitude]|location[latitude]|location[timestamp]|
        |test name|09876543210987654321|1.0|61.12345|24.12345|1319193664123|
      Then the response status should be "201"
      And response JSON has valid schema
      And new barcode has score "25.0"
    
    Scenario: User adds a code that already exists in the system 14 times and new score is calculated correctly
      Given I accept JSON
      When there are 14 barcodes with the same code 09876543210987654321 in the system
      And I send a new barcode via HTTP API with the following:
        |barcode[name]|barcode[code]|location[accuracy]|location[longitude]|location[latitude]|location[timestamp]|
        |test name|09876543210987654321|1.0|61.12345|24.12345|1319193664123|
      Then the response status should be "201"
      And response JSON has valid schema
      And new barcode has score "6.0"
    
      
