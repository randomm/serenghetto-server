Feature: Post user location
  In order to share users' locations within the game 
  A user
  Should be able to post their location to the system

  Scenario: User posts their location to the application via JSON
    Given I am a user named "foo" with an email "user@test.com" and password "please"
    And I accept JSON
    When I post my email "user@test.com" and password "please" to "/api/session"
    Then I should be logged in
    When I update my location in the system with following data:
      |user[location][description]|user[location][latitude]|user[location][longitude]|user[location][accuracy]|user[location][timestamp]|
      |Test Description|62.123456|24.123456|1.0|1319193664|
    Then the response status should be "201"
    And response JSON has valid schema
    And user location should be updated to:
      |user[location][description]|user[location][latitude]|user[location][longitude]|user[location][accuracy]|user[location][timestamp]|
      |Test Description|62.123456|24.123456|1.0|1319193664|