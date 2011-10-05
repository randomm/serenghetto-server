Given /^I accept JSON$/ do
  page.driver.header 'Accept', "text/json"
end