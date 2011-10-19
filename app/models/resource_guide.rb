class ResourceGuide < ActiveRecord::Base

  named_scope :same_audience_type,  lambda { |att| {:conditions => ["audience_type = ?", att]} }
  named_scope :previous,       lambda { |att| {:conditions => ["id < ?", att]} }
  named_scope :next,           lambda { |att| {:conditions => ["id > ?", att]} }

  acts_as_indexed :fields => [:title, :body, :custom_url, :audience_type]

  has_friendly_id :title_or_custom, :use_slug => true

  validates :title, :presence => true, :uniqueness => true
  
  belongs_to :link_image, :class_name => 'Image'
  belongs_to :author, :class_name => 'GuideAuthor'
  
  def employer_resource?
    audience_type =~ /employers/i
  end
  
  def student_resource?
    audience_type =~ /students/i
  end
  
  protected
  
  def title_or_custom
    use_custom_url ? custom_url : title
  end
end
