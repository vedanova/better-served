Then(/^a new request should have been created$/) do
  Request.count.should eq 1
end