And(/^there should have been an organisation with name "([^"]*)" created$/) do |name|
  Organisation.exists?(name: name)
end