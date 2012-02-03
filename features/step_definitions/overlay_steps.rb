When /^I request overlays with no viewport given$/ do
  get '/api/overlays'
end

When /^I request overlays for a viewport for which tiles do not exist$/ do
  get '/api/overlays?lat1=61.0&lat2=61.02&lon1=26.0&lon2=26.1&'
end

Then /^response should contain valid overlay data$/ do
#  debugger
end