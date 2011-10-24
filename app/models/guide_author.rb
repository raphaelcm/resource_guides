class GuideAuthor < ActiveRecord::Base

  acts_as_indexed :fields => [:name, :email, :twitter, :bio]

  validates :name, :presence => true, :uniqueness => true
  
  has_friendly_id :name, :use_slug => true
  
  belongs_to :author_image, :class_name => 'Image'
end
