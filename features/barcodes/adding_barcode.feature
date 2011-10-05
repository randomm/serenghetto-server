Feature: Add new barcode
  In order to play the game 
  A user
  Should be able to add new barcodes into the system

  Background:
    Given I accept JSON
    And I am a user named "foo" with an email "user@test.com" and password "please"
    When I sign in as "user@test.com/please"
    Then I should be signed in


    @wip
    Scenario: User posts new barcode via HTTP API
      When I send a new barcode via HTTP API with the following:
        |name|barcode|description|
        |test name|0123456789|test description|
      Then HTTP response code should be 200
      Then show me the response






      