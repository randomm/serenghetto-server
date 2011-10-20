Then /^response JSON has valid schema$/ do
  body = JSON.parse(last_response.body)
  assert body.has_key? 'body'
  assert body.has_key? 'message'
end

Given /^I send a new barcode via HTTP API with the following:$/ do |body|
  post '/api/barcode', body.hashes.first
end

Then /^I debug$/ do
  breakpoint
  0
end

#Then /^HTTP response code should be (\d+)$/ do |code|
#  page.driver.status_code.should == code.to_i
#end

Then /^I should see all the barcodes$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I send a GET request for "([^\"]*)"$/ do |path|
  get path
end

When /^I send a POST request to "([^\"]*)" with the following:$/ do |path, body|
  post path, body
end

When /^I send a PUT request to "([^\"]*)" with the following:$/ do |path, body|
  put path, body
end

When /^I send a DELETE request to "([^\"]*)"$/ do |path|
  delete path
end

Then /^the JSON response should be an array with (\d+) "([^\"]*)" elements$/ do |number_of_children, name|
  page = JSON.parse(last_response.body)
  page.map { |d| d[name] }.length.should == number_of_children.to_i
end