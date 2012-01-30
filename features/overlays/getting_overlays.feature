Feature: Get overlays
  In order to play the game 
  A user
  Should be able to view game world as an overlay on top of a map

  Scenario: Devise does not provide viewport when getting overlays
    Given I accept JSON
    When I request overlays with no viewport given
    Then I get overlays error back
