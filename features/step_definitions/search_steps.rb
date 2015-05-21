Given(/^I am into the search page$/) do
  @page = @page.search
end

When(/^I am looking for "([^"]*)"$/) do |text|
  @page.look_for(text)
end

Then(/^I see the name "([^"]*)"$/) do |name|
  expect(@page.text_exists?(name)).to be true
end
