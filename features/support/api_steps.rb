Then /^the response status should be "([^"]*)"$/ do |status|
  assert_equal status.to_i, last_response.status
end

Given /^I accept JSON$/ do
  header 'Accept', 'application/json'
#  header 'Content-Type', 'application/json'
end
