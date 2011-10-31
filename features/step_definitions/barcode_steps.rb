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

When /^I request a list of barcodes I have submitted to the system$/ do
  user_id = JSON.parse(last_response.body)['body']['user']['id']
  get '/api/'+user_id.to_s+'/barcodes'
end

When /^I have (\d+) barcodes in the system$/ do |n|
  n.to_i.times do 
    Factory.create(:barcode, :user => User.find(@user_id) )
  end
end

Then /^response has (\d+) barcodes$/ do |arg1|
  body = JSON.parse(last_response.body)['body']
  assert body['entries'].length.should == arg1.to_i
end

When /^there are (\d+) barcodes in the system$/ do |n|
  n.to_i.times do 
    Factory.create(:barcode)
  end
end

When /^I request all barcodes in the system$/ do
  get '/api/barcodes'
end

Given /^there is a barcode with location data in the system$/ do
  b = Factory.create(:barcode)
  @barcode_id = b.id
end

When /^I request that barcode$/ do
  get '/api/barcodes/'+@barcode_id.to_s
end

Then /^barcode has location information attached$/ do
  body = JSON.parse(last_response.body)['body']
  debugger
  assert body['entries'][0].has_key?('location').should be_true
end