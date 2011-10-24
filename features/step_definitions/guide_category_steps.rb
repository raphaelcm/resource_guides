Given /^I have no guide_categories$/ do
  GuideCategory.delete_all
end

Given /^I (only )?have guide_categories titled "?([^\"]*)"?$/ do |only, titles|
  GuideCategory.delete_all if only
  titles.split(', ').each do |title|
    GuideCategory.create(:name => title)
  end
end

Then /^I should have ([0-9]+) guide_categor[y|ies]+?$/ do |count|
  GuideCategory.count.should == count.to_i
end
