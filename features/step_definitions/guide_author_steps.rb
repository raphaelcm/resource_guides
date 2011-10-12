Given /^I have no guide_authors$/ do
  GuideAuthor.delete_all
end

Given /^I (only )?have guide_authors titled "?([^\"]*)"?$/ do |only, titles|
  GuideAuthor.delete_all if only
  titles.split(', ').each do |title|
    GuideAuthor.create(:name => title)
  end
end

Then /^I should have ([0-9]+) guide_authors?$/ do |count|
  GuideAuthor.count.should == count.to_i
end
