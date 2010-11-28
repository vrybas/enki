Then /I should see a link to all posts tagged "([\w\s]+)"/ do |tag_name|
  page.find(:xpath, "//a[@href = '/#{tag_name}']").text.should eq tag_name
end
