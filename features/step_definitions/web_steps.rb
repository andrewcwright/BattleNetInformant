Given(/^the user "(.*?)" with password "(.*?)"$/) do |email, password|
  user = User.create(email: email, password: password)
  refute user.new_record?
end

When(/^I go to the homepage$/) do
  visit "/"
end

When(/^I (?:click|press) "(.*?)"$/) do |text|
  click_link_or_button text
end

When(/^I fill in "(.*?)" for "(.*?)"$/) do |value, field|
  fill_in field, :with => value
end

Then(/^I should see "(.*?)"$/) do |text|
  page.should have_content text
end

Then(/^I should not see "(.*?)"$/) do |text|
  page.should_not have_content text
end