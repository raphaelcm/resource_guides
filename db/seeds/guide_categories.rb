if defined?(User)
  User.all.each do |user|
    if user.plugins.where(:name => 'guide_categories').blank?
      user.plugins.create(:name => 'guide_categories',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end

if defined?(Page)
  page = Page.create(
    :title => 'Guide Categories',
    :link_url => '/guide_categories',
    :deletable => false,
    :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
    :menu_match => '^/guide_categories(\/|\/.+?|)$'
  )
  Page.default_parts.each do |default_page_part|
    page.parts.create(:title => default_page_part, :body => nil)
  end
end