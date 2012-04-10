module BasicHelpers
end

World(BasicHelpers)

Given /^I have sent email from contacts page$/ do
  visit('/contacts')
  fill_in('Email', :with => 'imsashko@gmail.com')
  fill_in('Subject', :with => 'subject')
  fill_in('Name', :with => 'name')
  fill_in('Message', :with => 'message')
  click_button('Send')
end
