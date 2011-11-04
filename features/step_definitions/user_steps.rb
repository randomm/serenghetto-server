Given /^no user exists with an email of "(.*)"$/ do |email|
  User.find(:first, :conditions => { :email => email }).should be_nil
end

Given /^I am a user named "([^"]*)" with an email "([^"]*)" and password "([^"]*)"$/ do |name, email, password|
  User.new(:name => name,
            :email => email,
            :password => password,
            :password_confirmation => password).save!
end

Given /^I am admin$/ do
  Factory(:admin)
end

# User == nil would probably be better?
Then /^I should be already signed in$/ do
  step %{I should see "Logout"}
end

# Separate "Signed up as" (Just insert the user to the variables) and "I login through the login screen" (Fill in the login form)
Given /^I am signed up as "(.*)\/(.*)"$/ do |email, password|
  step %{I am not logged in}
  step %{I go to the sign up page}
  step %{I fill in "Email" with "#{email}"}
  step %{I fill in "Password" with "#{password}"}
  step %{I fill in "Password confirmation" with "#{password}"}
  step %{I press "Sign up"}
  step %{I should see "You have signed up successfully. If enabled, a confirmation was sent to your e-mail."}
  step %{I am logout}
end

# /sign_out logs out the user instantly?
Then /^I sign out$/ do
  visit('/users/sign_out')
end

# "I am not logged in" sounds better
Given /^I am logout$/ do
  step %{I sign out}
end

# User == nil ? ok : @user = nil
Given /^I am not logged in$/ do
  step %{I sign out}
end

# Duplicate.. same thing as above.
When /^I sign in as "(.*)\/(.*)"$/ do |email, password|
  step %{I am not logged in}
  step %{I go to the sign in page}
  step %{I fill in "Email" with "#{email}"}
  step %{I fill in "Password" with "#{password}"}
  step %{I press "Sign in"}
end

# Check if signed in should check if the user is signed in, not if there's some text on screen (That can be tested with "I should see..")
Then /^I should be signed in$/ do
  step %{I should see "Signed in successfully."}
end

# ?
When /^I return next time$/ do
  step %{I go to the home page}
end

Then /^I should be signed out$/ do
  step %{I should see "Sign up"}
  step %{I should see "Login"}
  step %{I should not see "Logout"}
end

When /^I change old password "([^"]*)" to "([^"]*)"$/ do |old_password, new_password|
  step %{I fill in "Password" with "#{new_password}"}
  step %{I fill in "Password confirmation" with "#{new_password}"}
  step %{I fill in "Current password" with "#{old_password}"}
  step %{I press "Update"}
end

Then /^new password should be "([^"]*)"$/ do |new_password|
  # test this via changing user name with new password
  step %{I follow "Edit account"}
  step %{I fill in "Name" with "baz"}
  step %{I fill in "Current password" with "#{new_password}"}
  step %{I press "Update"}
  step %{I follow "Edit account"}
  step %{the "Name" field should equal "baz"}
end

When /^I post my email "([^"]*)" and password "([^"]*)" to "([^"]*)"$/ do |arg1, arg2, arg3|
  post arg3, :user => { :email => arg1, :password => arg2 }
end

Given /^I log in$/ do
  step %{I post my email "#{@user.email}" and password "#{@user.password}" to "/api/session"}
  step %{I should be logged in}
end

Given /^I am a registered user$/ do
  @user = FactoryGirl.create(:user)
end

Then /^I should be logged in$/ do
  body = JSON.parse(last_response.body)["body"]
  body.has_key?("user").should be_true
  body["user"].has_key?("token").should be_true
  @user_id = body['user']['id']
end

Then /^get an authentication token back$/ do
  body = JSON.parse(last_response.body)["body"]
  body["user"].has_key?("token").should be_true
end

Then /^I should not be signed in$/ do
  body = JSON.parse(last_response.body)["body"]
  body["user"].has_key?("token").should be_false
end