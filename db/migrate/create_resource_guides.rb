class CreateResourceGuides < ActiveRecord::Migration

  def self.up
    create_table :resource_guides do |t|
      t.string :title
      t.text :body
      t.integer :link_image_id
      t.string :tags
      t.string :custom_url
      t.string :audience_type
      t.integer :position

      t.timestamps
    end

    add_index :resource_guides, :id

    load(Rails.root.join('db', 'seeds', 'resource_guides.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "resource_guides"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/resource_guides"})
    end

    drop_table :resource_guides
  end

end
