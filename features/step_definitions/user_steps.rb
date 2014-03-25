def create_visitor
  @visitor ||= {:first_name => "Testy", :last_name => "McUserton", :email => "example@example.com",
                :password => "please", :password_confirmation => "please", username: 'tester'}
  @organisation ||= {name: 'Acme'}
end

### GIVEN ###
Given /^I am not logged in$/ do
  rack_test_session_wrapper = Capybara.current_session.driver
  rack_test_session_wrapper.submit :post, "/logout", nil
end
Given /^I am logged in$/ do
  create_user
  sign_in
end

Given /^I exist as a user$/ do
  create_user
end

def create_user
  create_visitor
  delete_user
  @user = User.make!(email: @visitor[:email])
end

def delete_user
  @user ||= User.where(:email => @visitor[:email]).first
  @user.destroy unless @user.nil?
end

When /^I sign up with valid user data$/ do
  create_visitor
  sign_up
end

def find_user
  @user ||= User.where(:email => @visitor[:email]).first
end


def sign_up
  delete_user
  visit '/signup'
  fill_in "user_organisation_attributes_name", :with => @organisation[:name]
  fill_in "user_username", :with => @visitor[:username]
  fill_in "user_first_name", :with => @visitor[:first_name]
  fill_in "user_last_name", :with => @visitor[:last_name]
  fill_in "Email", :with => @visitor[:email]
  fill_in "user_password", :with => @visitor[:password]
  fill_in "user_password_confirmation", :with => @visitor[:password_confirmation]
  #check "user_toc_accepted" unless @toc_missing
  click_button "Sign up"
  find_user
end

Then /^I should see a successful sign up message$/ do
  page.should have_content "A message with a confirmation link has been sent to your email address."
end

When /^I sign up with an invalid email$/ do
  create_visitor
  @visitor = @visitor.merge(:email => "notanemail")
  sign_up
end


Then /^I should see an invalid email message$/ do
  page.should have_content "is invalid"
end

Then /^I should see a missing password message$/ do
  page.should have_content "can't be blank"
end


Then /^I should see a missing password confirmation message$/ do
  page.should have_content "doesn't match Password"
end

Then /^I should see a mismatched password message$/ do
  page.should have_content "doesn't match Password"
end

Then /^I should see a signed out message$/ do
  page.should have_content "Signed out successfully."
end

Then /^I see an invalid login message$/ do
  page.should have_content "Invalid email or password."
end

Then /^I should see the missing toc message$/ do
  page.should have_content "You need to accept the terms of conditions in order to use FME Cloud"
end

But /^I do not have a payment account yet$/ do
  Account.last.update_attribute(:braintree_customer_id, nil)
end

When /^I confirm my account using the link in the email$/ do
  step "I open the email"
  step "I click the first link in the email"
end

When /^I sign up without a password$/ do
  create_visitor
  @visitor = @visitor.merge(:password => "")
  sign_up
end


When /^I sign up with a mismatched password confirmation$/ do
  create_visitor
  @visitor = @visitor.merge(:password_confirmation => "please123")
  sign_up
end

When /^I return to the site$/ do
  visit '/'
end

When /^I sign in with a wrong email$/ do
  @visitor = @visitor.merge(:email => "wrong@example.com")
  sign_in
end

When /^I sign in with a wrong password$/ do
  @visitor = @visitor.merge(:password => "wrongpass")
  sign_in
end


When /^I sign up without a password confirmation$/ do
  create_visitor
  @visitor = @visitor.merge(:password_confirmation => "")
  sign_up
end

When /^I sign up without an organisation/ do
  create_visitor
  @organisation = @organisation.merge(:name => "")
  sign_up
end


Then /^I should see a missing organisation message$/ do
  within '.user_organisation_name' do
    page.should have_content "can't be blank"
  end
end
