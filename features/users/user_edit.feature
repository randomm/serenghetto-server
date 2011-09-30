Feature: Edit User
  As a registered user of the website
  I want to edit my user profile
  so I can change all my user details

    Background: I sign in
      Given I am a user named "foo" with an email "user@test.com" and password "please"
      And I sign in as "user@test.com/please"
      Then I should be signed in

    Scenario: I edit my user name
      When I follow "Edit account"
      And I fill in "Name" with "baz"
      And I fill in "Current password" with "please"
      And I press "Update"
      And I follow "Edit account"
      Then the "Name" field should equal "baz"

    Scenario: I edit my email address
      When I follow "Edit account"
      And I fill in "Email" with "asdf@asdf.com"
      And I fill in "Current password" with "please"
      And I press "Update"
      And I follow "Edit account"
      Then the "Email" field should equal "asdf@asdf.com"

    Scenario: I change my password
      When I follow "Edit account"
      And I change old password "please" to "pleaseplease"
      Then I should not see "Password doesn't match confirmation"
      And new password should be "pleaseplease"
