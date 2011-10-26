Feature: Add new barcode
  In order to play the game 
  A user
  Should be able to view their own and other players' barcode scans

  @dev
  Scenario: Logged in user lists their barcodes
    Given I am a registered user
    And I accept JSON
    And I log in
    When I have 37 barcodes in the system
    And I request a list of barcodes I have submitted to the system
    Then the response status should be "200"
    And response JSON has valid schema
    And response has 37 barcodes