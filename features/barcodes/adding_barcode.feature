Feature: Add new barcode
  In order to play the game 
  A user
  Should be able to add new barcodes into the system

  Background:
    Given I am a user named "foo" with an email "user@test.com" and password "please"
    And I accept JSON
    When I post my email "user@test.com" and password "please" to the sign in page
#    Then I debug
    Then the response should be a success

    @wip
    Scenario: User posts new barcode via HTTP API
      Given I accept JSON
      When I send a new barcode via HTTP API with the following:
        |name|barcode|description|
        |test name|0123456789|test description|
      Then the response should be a success






      