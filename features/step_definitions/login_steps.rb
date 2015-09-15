require 'byebug'

Given(/^I am about to login$/) do
  @page = @page.login
end

When(/^I enter valid credentials$/) do
  user = CREDENTIALS[:valid_user]
  @page = @page.enter_credentials(user[:username],
                                  user[:password],
                                  CREDENTIALS[:site]
                                 )
end

And(/^I can see posts for the site$/) do
  @page.post_exists?
end
