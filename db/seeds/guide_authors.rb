if defined?(User)
  User.all.each do |user|
    if user.plugins.where(:name => 'guide_authors').blank?
      user.plugins.create(:name => 'guide_authors',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end

if defined?(Page)
  page = Page.create(
    :title => 'Guide Authors',
    :link_url => '/guide_authors',
    :deletable => false,
    :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
    :menu_match => '^/guide_authors(\/|\/.+?|)$'
  )
  Page.default_parts.each do |default_page_part|
    page.parts.create(:title => default_page_part, :body => nil)
  end
end