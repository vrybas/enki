Given /^I have an? "([^"]*)" with:$/ do |model, fields|
  Factory(model, fields.rows_hash)
end