Given /^I have an? "([^"]*)" with:$/ do |model, fields|
  attribs = {}
  fields.rows_hash.each do |k,v|
    v = (v == "true" ? true : false) if v == "true" || v == "false"
    attribs[k] = v
  end
  
  Factory(model, attribs)
end