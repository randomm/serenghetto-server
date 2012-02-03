Feature: Get overlays
  In order to play the game 
  A user
  Should be able to view game world as an overlay on top of a map

  Scenario: Client does not provide viewport when getting overlays
    Given I accept JSON
    When I request overlays with no viewport given
    Then the response status should be "403"
    And response JSON has valid schema

  Scenario: Tiles are created and overlay delivered for given viewport
    Given I accept JSON
    When I request overlays for a viewport for which tiles do not exist
    Then the response status should be "201"
    And response JSON has valid schema
    And response should contain valid overlay data
