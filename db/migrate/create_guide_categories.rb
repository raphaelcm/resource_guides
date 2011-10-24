class CreateGuideCategories < ActiveRecord::Migration

  def self.up
    create_table :guide_categories do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end

    add_index :guide_categories, :id

    load(Rails.root.join('db', 'seeds', 'guide_categories.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "guide_categories"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/guide_categories"})
    end

    drop_table :guide_categories
  end

end
