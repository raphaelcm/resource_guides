Given /^I have no resource_guides$/ do
  ResourceGuide.delete_all
end

Given /^I (only )?have resource_guides titled "?([^\"]*)"?$/ do |only, titles|
  ResourceGuide.delete_all if only
  titles.split(', ').each do |title|
    ResourceGuide.create(:title => title)
  end
end

Then /^I should have ([0-9]+) resource_guides?$/ do |count|
  ResourceGuide.count.should == count.to_i
end
