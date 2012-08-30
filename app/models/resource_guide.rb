class ResourceGuide < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :body, :custom_url, :audience_type]

  has_friendly_id :title_or_custom, :use_slug => true

  validates :title, :presence => true, :uniqueness => true
  
  belongs_to :link_image, :class_name => 'Image'
  belongs_to :guide_author, :class_name => 'GuideAuthor'
  belongs_to :guide_category, :class_name => 'GuideCategory'
  
  #
  # Scopes
  #
  default_scope order('position ASC')
  scope :for_audience,  lambda { |a| where(:audience_type => a) }
  scope :featured, where(:featured => true)
  scope :latest, order("created_at desc")
  scope :category, lambda { |c| where(:guide_category => c) }
  
  def audience
    audience_type
  end
  
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
