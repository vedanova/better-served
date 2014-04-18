When(/^I click the (feedback|waiter) button$/) do |btn|
  case btn
    when 'feedback'
      click_on t('pub.actions.show.feedback')
    when 'waiter'
      click_on t('pub.actions.show.waiter')
  end
end

And(/^I submit my feedback$/) do
  fill_in 'feedback_content', with: 'Awesome food, but slow waiters'
  fill_in 'feedback_email', with: 'foo@example.com'
  click_on 'Abschicken'
end

Then(/^a new feedback should have been created$/) do
  Feedback.count.should eq 1
end

And(/^I should see the thank you message$/) do
  page.should have_content I18n.t('pub.requests.create')
end