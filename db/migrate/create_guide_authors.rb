class CreateGuideAuthors < ActiveRecord::Migration

  def self.up
    create_table :guide_authors do |t|
      t.string :name
      t.string :email
      t.string :twitter
      t.integer :author_image_id
      t.text :bio
      t.integer :position

      t.timestamps
    end

    add_index :guide_authors, :id

    load(Rails.root.join('db', 'seeds', 'guide_authors.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "guide_authors"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/guide_authors"})
    end

    drop_table :guide_authors
  end

end
