Feature: Add new barcode
  In order to play the game 
  A user
  Should be able to view their own and other players' barcode scans

  Scenario: Logged in user lists their barcodes
    Given I am a registered user
    And I accept JSON
    And I log in
    When I have 37 barcodes in the system
    And I request a list of barcodes I have submitted to the system
    Then the response status should be "200"
    And response JSON has valid schema
    And response has 37 barcodes
    
  Scenario: User lists all barcodes in the system
    Given I accept JSON
    When there are 127 barcodes in the system
    And I request all barcodes in the system
    Then the response status should be "200"
    And response JSON has valid schema
    And response has 127 barcodes
    
  @dev
  Scenario: User gets one barcode together with location data
    Given I accept JSON
    And there is a barcode with location data in the system
    When I request that barcode
    Then the response status should be "200"
    And response JSON has valid schema
    And barcode has location information attached
