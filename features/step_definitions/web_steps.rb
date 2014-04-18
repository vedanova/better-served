module WithinHelpers
  def with_scope(locator)
    locator ? within(locator) { yield } : yield
  end
end
World(WithinHelpers)

Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end


Then /^(?:|I )should be on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should match(path_to(page_name))
  else
    assert_equal path_to(page_name), current_path
  end
end

Then /^(?:|I )should see "([^\"]*)"(?: within "([^\"]*)")?$/ do |text, selector|
  with_scope(selector) do
    if page.respond_to? :should
      page.should have_content(text)
    else
      assert page.has_content?(text)
    end
  end
end

Then /^(?:|I )should not see "([^\"]*)"(?: within "([^\"]*)")?$/ do |text, selector|
  with_scope(selector) do
    if page.respond_to? :should
      page.should_not have_content(text)
    else
      !assert page.has_content?(text)
    end
  end
end

Then /^show me the page$/ do
  save_and_open_page
end

Then /^save page$/ do
  save_page
end

When /^(?:|I )follow "([^"]*)"(?: within "([^"]*)")?$/ do |link, selector|
  with_scope(selector) do
    click_link(link)
  end
end

When /^I reload the page$/ do
  visit current_path
end

Then /^the field with id "([^"]*)" should contain "([^"]*)"$/ do |field, value|
  field_value = find_field("#{field}")["value"]
  if field_value.respond_to? :should
    field_value.should =~ /#{value}/
  else
    assert_match(/#{value}/, field_value)
  end
end

When /^(?:|I )select "([^"]*)" from "([^"]*)"(?: within "([^"]*)")?$/ do |value, field, selector|
  with_scope(selector) do
    select(value, :from => field)
  end
end

Then /^the "([^"]*)" drop-down should (not )?contain the option "([^"]*)"$/ do |id, negate, value|
  if negate
    page.should_not have_xpath "//select[@id = '#{id}']/option[@value = '#{value}']"
  else
    page.should have_xpath "//select[@id = '#{id}']/option[@value = '#{value}']"
  end
end