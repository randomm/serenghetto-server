Feature: Sign in
  In order to get access to protected sections of the site
  A user
  Should be able to sign in

    Scenario: User is not signed up
      Given I am not logged in
      And no user exists with an email of "user@test.com"
      When I go to the sign in page
      And I sign in as "user@test.com/please"
      Then I should see "Invalid email or password."
      And I go to the home page
      And I should be signed out

    Scenario: User enters wrong password
      Given I am not logged in
      And I am a user named "foo" with an email "user@test.com" and password "please"
      When I go to the sign in page
      And I sign in as "user@test.com/wrongpassword"
      Then I should see "Invalid email or password."
      And I go to the home page
      And I should be signed out

    Scenario: User signs in successfully with email
      Given I am not logged in
      And I am a user named "foo" with an email "user@test.com" and password "please"
      When I go to the sign in page
      And I sign in as "user@test.com/please"
      Then I should see "Signed in successfully."
      And I should be signed in
      When I return next time
      Then I should be already signed in

    @wip
    Scenario: User signs in through a mobile device (Accept: text/json)
      Given I am not logged in
      And I accept JSON
      And I am a user named "foo" with an email "user@test.com" and password "please"
      When I post my email "user@test.com" and password "please" to "/api/session"
      Then I should be signed in and get an authentication token back

    @wip
    Scenario: User enters wrong password through a mobile device (Accept: text/json)
      Given I am not logged in
      And I accept JSON
      And I am a user named "foo" with an email "user@test.com" and password "please"
      When I post my email "user@test.com" and password "wrongpassword" to "/api/session"
#      Then I debug
      Then I should not be signed in